//
//  ViewControllerForgotPassword.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 25/05/21.
//

import UIKit
import MaterialComponents
import Firebase

class ViewControllerForgotPassword: UIViewController {

    @IBOutlet weak var emailField: MDCTextField!
    @IBOutlet weak var sendButton: MDCButton!
    
    var emailController: MDCTextInputControllerOutlined?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sendButton.layer.cornerRadius = 8
        sendButton.setTitleColor(.white, for: .normal)
        emailController = MDCTextInputControllerOutlined(textInput: emailField)
        emailController = MDCTextInputControllerOutlined(textInput: emailField)
        
        emailController?.applyTheme(withScheme: appTheme)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func emailChanged(_ sender: MDCTextField) {
        
    }
    
    @IBAction func sendTapped(_ sender: Any) {
        if emailField.isValidEmail() {
            guard let email = emailField.text else { return }
            let auth = Auth.auth()
            auth.sendPasswordReset(withEmail: email) { (err) in
                if let err = err {
                    if err.localizedDescription.contains("There is no user record corresponding to this identifier") {
                        AlertToast.show(message: "El correo ingresado no existe.", controller: self, type: .Error) {}
                    } else {
                        AlertToast.show(message: "Hubo un error al enviar el correo, intente nuevamente.", controller: self, type: .Error) {}
                    }
                } else {
                    AlertToast.show(message: "Se ha enviado correo de recuperación.", controller: self, type: .Success) {}
                }
            }
        } else {
            AlertToast.show(message: "Correo inválido.", controller: self, type: .Error) {}
        }
    }
}
