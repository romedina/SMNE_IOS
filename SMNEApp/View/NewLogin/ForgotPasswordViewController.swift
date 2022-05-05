//
//  ForgotPasswordViewController.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/03/22.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    
    var emailField: GenericTextField = {
        let view = GenericTextField()
        view.keyboardType = .emailAddress
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sendButton : SMNEButton = {
        let view = SMNEButton(style: .fill)
        view.setTitle("Enviar", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "arrowL", in: BundleLocal.local, compatibleWith: nil), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "¿Olvidaste tu contraseña?"
        view.font = UIFont(name: "Open Sans Bold", size: 16.0)
        view.textColor = .C00D9CC()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Para poder recuperar tu contraseña, es necesario ingresar tu email."
        view.numberOfLines = 0
        view.font = UIFont(name: "Open Sans Bold", size: 28.0)
        view.textColor = .C052D6C()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let infoLabel: UILabel = {
        let view = UILabel()
        view.text = "Te enviaremos un correo electrónico con los pasos que debes seguir."
        view.numberOfLines = 0
        view.font = UIFont(name: "Open Sans Regular", size: 16.0)
        view.textColor = .C052D6C()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setButtons()
    }
    
    func setButtons() {
        sendButton.addTarget(self, action: #selector(sendRecoveryMail), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    func addViews() {
        view.addSubview(backButton)
        view.addSubview(viewTitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(infoLabel)
        view.addSubview(emailField)
        view.addSubview(sendButton)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 29),
            backButton.heightAnchor.constraint(equalToConstant: 29),
            
            viewTitleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            viewTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            titleLabel.topAnchor.constraint(equalTo: viewTitleLabel.bottomAnchor, constant: 50),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            
            emailField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            sendButton.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        emailField.setValues(placeholder: "Nombre", text: nil)
    }
    
    @objc func sendRecoveryMail() {
        if emailField.isValidEmail(), let email = emailField.text {
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
    
    @objc func dismissView() {
        dismiss(animated: true)
    }

}
