//
//  ViewControllerLogin.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn
import MaterialComponents

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var emailField: MDCTextField!
    @IBOutlet weak var passwordField: MDCTextField!
    
    @IBOutlet weak var loginButton: MDCButton!
    @IBOutlet weak var appleLogin: MDCButton!
    @IBOutlet weak var gmailLogin: MDCButton!
    @IBOutlet weak var faceLogin: MDCButton!
    
    var emailController: MDCTextInputControllerOutlined?
    var passController: MDCTextInputControllerOutlined?
    let rightButton = UIButton(type: .custom)
    
    var flags = [false, false]
    
    var email = ""
    var pass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        emailController = MDCTextInputControllerOutlined(textInput: emailField)
        passController = MDCTextInputControllerOutlined(textInput: passwordField)
        
        emailController?.applyTheme(withScheme: appTheme)
        passController?.applyTheme(withScheme: appTheme)
        
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        rightButton.addTarget(self, action: #selector(passChangeView), for: .touchUpInside)
        rightButton.setImage(UIImage(named: "eye.fill"), for: .normal)
        rightButton.tintColor = .C052D6C()
        
        passwordField.trailingView = rightButton
        passwordField.trailingViewMode = .always
        
        loginButton.layer.cornerRadius = 8
        
        appleLogin.setBackgroundColor(.white)
        appleLogin.setBorderWidth(1.0, for: .normal)
        appleLogin.setBorderColor(.C00D9CC(), for: .normal)
        appleLogin.layer.cornerRadius = 8
        appleLogin.setImage(#imageLiteral(resourceName: "apple"), for: .normal)
        appleLogin.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        
        gmailLogin.setBackgroundColor(.white)
        gmailLogin.setBorderWidth(1.0, for: .normal)
        gmailLogin.setBorderColor(.C00D9CC(), for: .normal)
        gmailLogin.layer.cornerRadius = 8
        gmailLogin.setImage(#imageLiteral(resourceName: "google"), for: .normal)
        gmailLogin.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        
        faceLogin.setBackgroundColor(.white)
        faceLogin.setBorderWidth(1.0, for: .normal)
        faceLogin.setBorderColor(.C00D9CC(), for: .normal)
        faceLogin.layer.cornerRadius = 8
        faceLogin.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        faceLogin.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        
        validateTextNotEmpty()
    }

    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func passChangeView() {
        passwordField.isSecureTextEntry.toggle()
        if passwordField.isSecureTextEntry {
            rightButton.setImage(UIImage(named: "eye.fill"), for: .normal)
        } else {
            rightButton.setImage(#imageLiteral(resourceName: "crossEye"), for: .normal)
        }
    }
    
    func validateTextNotEmpty() {
        if flags[0] && flags[1] {
            loginButton.isEnabled = true
            loginButton.backgroundColor?.withAlphaComponent(1.0)
            infoChanged(email: emailField.text!, pass: passwordField.text!)
        } else {
            loginButton.backgroundColor?.withAlphaComponent(0.61)
            loginButton.isEnabled = false
        }
    }
    
    @IBAction func emailChanged(_ sender: MDCTextField) {
        if sender.text != "" && sender.text != nil {
            flags[0] = true
        } else {
            flags[0] = false
        }
        validateTextNotEmpty()
    }
    
    @IBAction func passChanged(_ sender: MDCTextField) {
        if sender.text != "" && sender.text != nil {
            flags[1] = true
        } else {
            flags[1] = false
        }
        validateTextNotEmpty()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        loginTapped()
    }
}

extension ViewControllerLogin: LoginCellDelegate {
    func otherLogin(type: TableViewCellLogin.LoginType) {
        switch type {
        case .apple:
            break
        case .google:
            GIDSignIn.sharedInstance()?.signOut()
            GIDSignIn.sharedInstance()?.signIn()
            break
        case .facebook:
            break
        }
    }
    
    func infoChanged(email: String, pass: String) {
        self.email = email
        self.pass = pass
    }
    
    func loginTapped() {
        let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
        nextVC.setAnim(type: .loading)
        let delegate: EndPillAnimationProtocol = nextVC
        nextVC.modalPresentationStyle = .fullScreen
        
        self.present(nextVC, animated: true) {
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (result, err) in
                if let err = err {
                    print(err.localizedDescription)
                    delegate.endAnimationWith(error: "error", completion: { () in
                        let warning = UIAlertController(title: "Error al iniciar sesión", message: "Usuario o clave incorrecta", preferredStyle: .alert)
                        warning.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(warning, animated: true, completion: nil)
                    })
                }
                if let result = result {
                    let firebase = FirebaseViewModel()
                    firebase.getDoctorDocument(uId: result.user.uid) { () in
                        delegate.endAnimation()
                    }
                }
            }
        }
    }
}

extension ViewControllerLogin:  GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
        nextVC.setAnim(type: .loading)
        let delegate: EndPillAnimationProtocol = nextVC
        nextVC.modalPresentationStyle = .fullScreen
        
        if error == nil && user != nil {
            self.present(nextVC, animated: true) {
                let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
                Auth.auth().signIn(with: credential) { (result, err) in
                    if let err = err {
                        print(err.localizedDescription)
                    }
                    if let result = result {
                        
                        let db = Firestore.firestore()
                        let docRef = db.collection("doctors").document(result.user.uid)
                        
                        docRef.getDocument { (doc, err) in
                            if doc == nil {
                                let complete = result.user.displayName?.split(separator: " ")
                                var name = ""
                                var lastName = ""
                                for i in complete! {
                                    if i == complete?.first {
                                        name = String(i)
                                    } else {
                                        lastName.append("\(String(i)) ")
                                    }
                                }
                                var info: [String: Any] = [:]
                                info["createdAt"] = Timestamp()
                                info["name"] = name
                                info["lastName"] = lastName
                                info["email"] = result.user.email
                                info["updatedAt"] = Timestamp()
                                docRef.setData(info) { (err) in
                                    if let err = err {
                                        GIDSignIn.sharedInstance()?.signOut()
                                        print(err.localizedDescription)
                                    } else {
                                        let user = UserDefaults.standard
                                        user.set(self.email, forKey: "email")
                                        user.set(name, forKey: "name")
                                        user.set(result.user.uid, forKey: "uId")
                                        user.set(lastName, forKey: "lastName")
                                        user.synchronize()
                                        delegate.endAnimation()
                                    }
                                }
                            } else {
                                //doc isnt nil
                                let user = UserDefaults.standard
                                if let name = doc?.get("name") as? String {
                                    user.set(name, forKey: "name")
                                }
                                if let email = doc?.get("email") as? String {
                                    user.set(email, forKey: "email")
                                }
                                if let lastName = doc?.get("lastName") as? String {
                                    user.set(lastName, forKey: "lastName")
                                }
                                if let lastName = doc?.get("country") as? String {
                                    user.set(lastName, forKey: "country")
                                }
                                if let lastName = doc?.get("gender") as? String {
                                    user.set(lastName, forKey: "gender")
                                }
                                if let lastName = doc?.get("professionalLicense") as? String {
                                    user.set(lastName, forKey: "cedula")
                                }
                                if let lastName = doc?.get("specialty") as? String {
                                    user.set(lastName, forKey: "espe")
                                }
                                if let lastName = doc?.get("MedicineSchool") as? String {
                                    user.set(lastName, forKey: "school")
                                }
                                
                                user.set(result.user.uid, forKey: "uId")
                                user.synchronize()
                                delegate.endAnimation()
                            }
                        }
                    }
                }
            }
        }
    }
}
