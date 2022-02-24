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

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var emailField: SMNETextField!
    @IBOutlet weak var passwordField: SMNETextField!
    
    @IBOutlet weak var loginButton: SMNEButton!
    @IBOutlet weak var appleLogin: SMNEButton!
    @IBOutlet weak var gmailLogin: SMNEButton!
    @IBOutlet weak var googleInfoLabel: UILabel!
    
    let rightButton = UIButton(type: .custom)
    
    var flags = [false, false]
    
    var email = ""
    var pass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        rightButton.addTarget(self, action: #selector(passChangeView), for: .touchUpInside)
        rightButton.setImage(UIImage(named: "eye"), for: .normal)
        rightButton.imageView?.contentMode = .scaleAspectFit
        rightButton.tintColor = .C052D6C()
        
        passwordField.rightView = rightButton
        passwordField.rightViewMode = .always
        
        loginButton.layer.cornerRadius = 8
        loginButton.setTitleColor(.white, for: .normal)
        
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
        
        let firstString = NSMutableAttributedString(
            string: "Al registrarse con gmail estas aceptando nuestros ",
            attributes: [
                .font: UIFont(name: "Open Sans Bold", size: 14.0) ?? UIFont.systemFont(ofSize: 15.0),
                .foregroundColor: UIColor.C00D9CC()
            ]
        )
        
        let attributeString = NSMutableAttributedString(
            string: "términos y condiciones",
            attributes: [
                .font: UIFont(name: "Open Sans Bold", size: 14.0) ?? UIFont.systemFont(ofSize: 15.0),
                .foregroundColor: UIColor.C00D9CC(),
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        let mString = NSMutableAttributedString()
        mString.append(firstString)
        mString.append(attributeString)
        googleInfoLabel.isUserInteractionEnabled = true
        googleInfoLabel.addGestureRecognizer(tap)
        googleInfoLabel.attributedText = mString
        
        validateTextNotEmpty()
    }
    
    @objc func labelTapped() {
        let terms = TermsConditionsViewController()
        terms.modalPresentationStyle = .fullScreen
        self.present(terms, animated: true)
    }

    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func passChangeView() {
        passwordField.isSecureTextEntry.toggle()
        if passwordField.isSecureTextEntry {
            rightButton.setImage(UIImage(named: "eye"), for: .normal)
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
    
    @IBAction func emailChanged(_ sender: SMNETextField) {
        if sender.text != "" && sender.text != nil {
            flags[0] = true
        } else {
            flags[0] = false
        }
        validateTextNotEmpty()
    }
    
    @IBAction func passChanged(_ sender: SMNETextField) {
        if sender.text != "" && sender.text != nil {
            flags[1] = true
        } else {
            flags[1] = false
        }
        validateTextNotEmpty()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        UserDefaults.standard.set("basic", forKey: "provider")
        loginTapped()
    }
    
    @IBAction func appleLoginTapped(_ sender: Any) {
        otherLogin(type: .apple)
    }
    
    @IBAction func gmailLoginTapped(_ sender: Any) {
        otherLogin(type: .google)
    }
    
    @IBAction func faceLoginTapped(_ sender: Any) {
        otherLogin(type: .facebook)
    }
}

extension ViewControllerLogin: LoginCellDelegate {
    func otherLogin(type: TableViewCellLogin.LoginType) {
        switch type {
        case .apple:
            UserDefaults.standard.set("apple", forKey: "provider")
            break
        case .google:
            UserDefaults.standard.set("google", forKey: "provider")
            firebaseLogOut()
            GIDSignIn.sharedInstance()?.signOut()
            GIDSignIn.sharedInstance()?.signIn()
            break
        case .facebook:
            UserDefaults.standard.set("facebook", forKey: "provider")
            firebaseLogOut()
//            faceBookLogin()
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
    
    func firebaseLogOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    func loginAndSaveToFirebase(credential: AuthCredential, delegate: EndPillAnimationProtocol) {
        Auth.auth().signIn(with: credential) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                delegate.endAnimationWith {
                    if err.localizedDescription.contains("account already exists") {
                        let warning = UIAlertController(title: "Error al iniciar sesión", message: "Ese correo ya está siendo utilizado con otra forma de ingreso.", preferredStyle: .alert)
                        warning.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(warning, animated: true, completion: nil)
                    } else {
                        let warning = UIAlertController(title: "Error al iniciar sesión", message: "Intente nuevamente.", preferredStyle: .alert)
                        warning.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(warning, animated: true, completion: nil)
                    }
                }
                return
            }
            if let result = result {
                
                let db = Firestore.firestore()
                let docRef = db.collection("doctors").document(result.user.uid)
                
                docRef.getDocument { (doc, err) in
                    if doc?.data() == nil {
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

extension ViewControllerLogin:  GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
        nextVC.setAnim(type: .loading)
        let delegate: EndPillAnimationProtocol = nextVC
        nextVC.modalPresentationStyle = .fullScreen
        
        if error == nil && user != nil {
            self.present(nextVC, animated: true) {
                let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
                self.loginAndSaveToFirebase(credential: credential, delegate: delegate)
            }
        }
    }
}
