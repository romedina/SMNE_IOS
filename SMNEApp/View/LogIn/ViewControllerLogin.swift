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
import AuthenticationServices
import CryptoKit

class ViewControllerLogin: UIViewController {
    
    enum LoginType {
        case apple
        case google
        case facebook
    }

    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var emailField: SMNETextField!
    @IBOutlet weak var passwordField: SMNETextField!
    
    @IBOutlet weak var loginButton: SMNEButton!
    @IBOutlet weak var appleLogin: SMNEButton!
    @IBOutlet weak var gmailLogin: SMNEButton!
    @IBOutlet weak var googleInfoLabel: UILabel!
    
    var currentNonce: String?
    
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
        
        emailField.setTextFieldLook()
        passwordField.setTextFieldLook()
        
        if #available(iOS 13, *) {
            appleLogin.isHidden = false
        }
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailField.setup()
        passwordField.setup()
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
    
    @IBAction func passwordResetTapped(_ sender: Any) {
        let view = ForgotPasswordViewController()
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        let view = RegisterViewController()
        view.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(view, animated: true)
    }
    
    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
}

@available(iOS 13.0, *)
extension ViewControllerLogin: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let nonce = currentNonce else { return }
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        guard let appleIDToken = appleIDCredential.identityToken else { return }
        guard let appleIDTokenString = String(data: appleIDToken, encoding: .utf8) else { return }
        let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: appleIDTokenString, rawNonce: nonce)
        let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
        nextVC.setAnim(type: .loading)
        let delegate: EndPillAnimationProtocol = nextVC
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true) {
            self.loginAndSaveToFirebase(credential: credential, delegate: delegate)
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
}

extension ViewControllerLogin {
    func otherLogin(type: LoginType) {
        switch type {
        case .apple:
            UserDefaults.standard.set("apple", forKey: "provider")
            firebaseLogOut()
            if #available(iOS 13.0, *) {
                currentNonce = randomNonceString()
                let appleIDProvider = ASAuthorizationAppleIDProvider()
                let request = appleIDProvider.createRequest()
                request.requestedScopes = [.email, .fullName]
                request.nonce = sha256(currentNonce!)
                let authorizationController = ASAuthorizationController(authorizationRequests: [request])
                authorizationController.delegate = self
                authorizationController.presentationContextProvider = self
                authorizationController.performRequests()
            }
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
                if err != nil {
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
                        if let completeName = complete {
                            for i in completeName {
                                if i == completeName.first {
                                    name = String(i)
                                } else {
                                    lastName.append("\(String(i)) ")
                                }
                            }
                        }
                        var info: [String: Any] = [:]
                        info["createdAt"] = Timestamp()
                        info["name"] = name
                        info["lastName"] = lastName
                        info["email"] = result.user.email
                        info["updatedAt"] = Timestamp()
                        docRef.setData(info) { (err) in
                            if err != nil {
                                GIDSignIn.sharedInstance()?.signOut()
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
