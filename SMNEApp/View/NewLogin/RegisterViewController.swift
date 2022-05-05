//
//  RegisterViewController.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/04/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    let backButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "arrowL", in: BundleLocal.local, compatibleWith: nil), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Cuenta nueva"
        view.font = UIFont(name: "Open Sans Bold", size: 16.0)
        view.textColor = .C00D9CC()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let parentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Para crear una cuenta debemos saber algunos datos sobre ti."
        view.numberOfLines = 0
        view.font = UIFont(name: "Open Sans Bold", size: 25)
        view.textColor = .C052D6C()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let infoLabel: UILabel = {
        let view = UILabel()
        view.text = "Una vez creada tu cuenta, puedes completar tu información dentro de tu perfil."
        view.numberOfLines = 0
        view.font = UIFont(name: "Open Sans Bold", size: 14)
        view.textColor = .C052D6C()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let personalLabel: UILabel = {
        let view = UILabel()
        view.text = "Datos personales"
        view.numberOfLines = 0
        view.font = UIFont(name: "Open Sans Bold", size: 16)
        view.textColor = .C052D6C()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameField: GenericTextField = {
        let view = GenericTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let surnameField: GenericTextField = {
        let view = GenericTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let accountLabel: UILabel = {
        let view = UILabel()
        view.text = "Datos de cuenta"
        view.numberOfLines = 0
        view.font = UIFont(name: "Open Sans Bold", size: 16)
        view.textColor = .C052D6C()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailField: GenericTextField = {
        let view = GenericTextField()
        view.keyboardType = .emailAddress
        view.textContentType = .emailAddress
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secretField: GenericTextField = {
        let view = GenericTextField()
        view.isSecureTextEntry = true
        view.rightViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let confirmField: GenericTextField = {
        let view = GenericTextField()
        view.isSecureTextEntry = true
        view.rightViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rightSecretButton: UIButton = {
        let view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        view.setImage(UIImage(named: "eye"), for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
        view.tintColor = .C052D6C()
        return view
    }()
    
    let rightConfirmSecretButton: UIButton = {
        let view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        view.setImage(UIImage(named: "eye"), for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
        view.tintColor = .C052D6C()
        return view
    }()
    
    let acceptTermsButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.C00D9CC().cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let goToTermsButton: UIButton = {
        let view = UIButton()
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Open Sans Bold", size: 15.0) ?? UIFont.systemFont(ofSize: 15.0),
            .foregroundColor: UIColor.C00D9CC(),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
            string: "Acepto términos y condiciones",
            attributes: yourAttributes
        )
        view.setAttributedTitle(attributeString, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let registerButton: SMNEButton = {
        let view = SMNEButton(style: .fill)
        view.backgroundColor = UIColor.C00D9CC().withAlphaComponent(0.5)
        view.setTitle("Registrar", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let privacyButton: SMNEButton = {
        let view = SMNEButton(style: .text)
        view.setTitle("Aviso de privacidad", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewModel = RegisterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setButtonsTargets()
        view.backgroundColor = .white
    }
    
    private func setButtonsTargets() {
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        goToTermsButton.addTarget(self, action: #selector(goToTermsTapped), for: .touchUpInside)
        acceptTermsButton.addTarget(self, action: #selector(acceptTermsTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(goToPrivacyTapped), for: .touchUpInside)
        rightSecretButton.addTarget(self, action: #selector(passChangeView), for: .touchUpInside)
        rightConfirmSecretButton.addTarget(self, action: #selector(passChangeView), for: .touchUpInside)
    }
    
    private func addViews() {
        view.addSubview(backButton)
        view.addSubview(viewTitleLabel)
        view.addSubview(registerButton)
        view.addSubview(privacyButton)
        
        parentView.addSubview(titleLabel)
        parentView.addSubview(infoLabel)
        parentView.addSubview(personalLabel)
        parentView.addSubview(nameField)
        parentView.addSubview(surnameField)
        parentView.addSubview(accountLabel)
        parentView.addSubview(emailField)
        parentView.addSubview(secretField)
        parentView.addSubview(confirmField)
        parentView.addSubview(acceptTermsButton)
        parentView.addSubview(goToTermsButton)
        
        scrollView.addSubview(parentView)
        view.addSubview(scrollView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 29),
            backButton.heightAnchor.constraint(equalToConstant: 29),
            
            viewTitleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            viewTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            
            parentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            parentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            parentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            parentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: parentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.trailingAnchor, constant: -30),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            infoLabel.trailingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.trailingAnchor, constant: -30),
            
            personalLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            personalLabel.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            
            nameField.topAnchor.constraint(equalTo: personalLabel.bottomAnchor, constant: 10),
            nameField.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.trailingAnchor, constant: -30),
            nameField.heightAnchor.constraint(equalToConstant: 50),
            
            surnameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 30),
            surnameField.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            surnameField.trailingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.trailingAnchor, constant: -30),
            surnameField.heightAnchor.constraint(equalToConstant: 50),
            
            accountLabel.topAnchor.constraint(equalTo: surnameField.bottomAnchor, constant: 30),
            accountLabel.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            
            emailField.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 10),
            emailField.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.trailingAnchor, constant: -30),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            secretField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30),
            secretField.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            secretField.trailingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.trailingAnchor, constant: -30),
            secretField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmField.topAnchor.constraint(equalTo: secretField.bottomAnchor, constant: 30),
            confirmField.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            confirmField.trailingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.trailingAnchor, constant: -30),
            confirmField.heightAnchor.constraint(equalToConstant: 50),
            
            acceptTermsButton.topAnchor.constraint(equalTo: confirmField.bottomAnchor, constant: 30),
            acceptTermsButton.leadingAnchor.constraint(equalTo: parentView.layoutMarginsGuide.leadingAnchor, constant: 30),
            acceptTermsButton.heightAnchor.constraint(equalToConstant: 30),
            acceptTermsButton.widthAnchor.constraint(equalToConstant: 30),
            acceptTermsButton.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -10),
            
            goToTermsButton.centerYAnchor.constraint(equalTo: acceptTermsButton.centerYAnchor),
            goToTermsButton.leadingAnchor.constraint(equalTo: acceptTermsButton.trailingAnchor, constant: 18),
            
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            privacyButton.centerYAnchor.constraint(equalTo: registerButton.centerYAnchor),
            privacyButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            privacyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        setPlaceholders()
    }
    
    private func setPlaceholders() {
        nameField.setValues(placeholder: "Nombre", text: nil)
        surnameField.setValues(placeholder: "Apellido paterno", text: nil)
        emailField.setValues(placeholder: "Email", text: nil)
        secretField.setValues(placeholder: "Contraseña", text: nil)
        confirmField.setValues(placeholder: "Repetir contraseña", text: nil)
        
        let rightViewParent = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        rightViewParent.addSubview(rightSecretButton)
        
        let rightViewConfirmParent = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        rightViewConfirmParent.addSubview(rightConfirmSecretButton)
        
        secretField.rightView = rightViewParent
        confirmField.rightView = rightViewConfirmParent
        
        setDelegatesForInputs()
    }
    
    private func setDelegatesForInputs() {
        nameField.addTarget(self, action: #selector(nameChanged(_:)), for: .editingChanged)
        surnameField.addTarget(self, action: #selector(surnameChanged(_:)), for: .editingChanged)
        emailField.addTarget(self, action: #selector(emailChanged(_:)), for: .editingChanged)
        secretField.addTarget(self, action: #selector(secretChanged(_:)), for: .editingChanged)
        confirmField.addTarget(self, action: #selector(confirmSecretChanged(_:)), for: .editingChanged)
    }
    
    @objc func acceptTermsTapped() {
        let newValue = !viewModel.getAccepetedTerms()
        if newValue {
            acceptTermsButton.setImage(UIImage(named: "radioCheck", in: BundleLocal.local, compatibleWith: nil), for: .normal)
        } else {
            acceptTermsButton.setImage(nil, for: .normal)
        }
        registerButton.backgroundColor = UIColor.C00D9CC().withAlphaComponent(newValue ? 1.0 : 0.5)
        registerButton.isUserInteractionEnabled = newValue
        viewModel.setAcceptedTerms(accepted: newValue)
    }
    
    @objc func goToTermsTapped() {
        let terms = TermsConditionsViewController()
        terms.modalPresentationStyle = .fullScreen
        self.present(terms, animated: true)
    }
    
    @objc func backTapped() {
        if let navCont = navigationController {
            navCont.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    @objc func goToPrivacyTapped() {
        let terms = TermsConditionsViewController()
        terms.modalPresentationStyle = .fullScreen
        self.present(terms, animated: true)
    }
    
    @objc func registerTapped() {
        if viewModel.validateInfo() {
            registerUser()
        } else {
            let alert = UIAlertController(title: "Error", message: "Llena todos los campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func nameChanged(_ sender: GenericTextField) {
        if sender.text != "" {
            viewModel.setName(name: sender.text)
        } else {
            viewModel.setName(name: nil)
        }
    }
    
    @objc func surnameChanged(_ sender: GenericTextField) {
        if sender.text != "" {
            viewModel.setSurname(surname: sender.text)
        } else {
            viewModel.setSurname(surname: nil)
        }
    }
    
    @objc func emailChanged(_ sender: GenericTextField) {
        if sender.text != "" && (sender.text ?? "").isValidEmail() {
            viewModel.setEmail(email: sender.text)
            sender.setNormal()
        } else {
            sender.setError(message: "Email inválido")
            viewModel.setEmail(email: nil)
        }
    }
    
    @objc func secretChanged(_ sender: GenericTextField) {
        if sender.text != "", sender.text?.count ?? 0 >= 8 {
            viewModel.setSecret(secret: sender.text)
        } else {
            viewModel.setSecret(secret: nil)
        }
    }
    
    @objc func confirmSecretChanged(_ sender: GenericTextField) {
        if sender.text != "", sender.text?.count ?? 0 >= 8, viewModel.validateSecret(sender.text) {
            viewModel.setConfirmSecret(confirmSecret: sender.text)
            sender.setNormal()
        } else {
            sender.setError(message: "No coinciden las contraseñas")
            viewModel.setConfirmSecret(confirmSecret: nil)
        }
    }
    
    @objc func passChangeView() {
        secretField.isSecureTextEntry.toggle()
        confirmField.isSecureTextEntry.toggle()
        if secretField.isSecureTextEntry {
            rightSecretButton.setImage(UIImage(named: "eye"), for: .normal)
            rightConfirmSecretButton.setImage(UIImage(named: "eye"), for: .normal)
        } else {
            rightSecretButton.setImage(#imageLiteral(resourceName: "crossEye"), for: .normal)
            rightConfirmSecretButton.setImage(#imageLiteral(resourceName: "crossEye"), for: .normal)
        }
    }
    
    private func registerUser() {
        guard let userInfo = viewModel.getEmailSecret(), userInfo.count == 4 else { return }
        let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
        nextVC.setAnim(type: .loading)
        let delegate: EndPillAnimationProtocol = nextVC
        nextVC.modalPresentationStyle = .fullScreen
        
        self.present(nextVC, animated: true) {
            Auth.auth().createUser(withEmail: userInfo[0], password: userInfo[1]) { (result, err) in
                if let err = err {
                    if err.localizedDescription == "The email address is already in use by another account." {
                        delegate.endAnimationWith(error: "") {
                            let alert = UIAlertController(title: "Error", message: "El email proporcionado ya esta siendo usado por otra cuenta.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }

                if let result = result {
                    var info: [String: Any] = [:]
                    info["createdAt"] = Timestamp()
                    info["name"] = userInfo[2]
                    info["lastName"] = userInfo[3]
                    info["email"] = userInfo[0]
                    info["updatedAt"] = Timestamp()
                    
                    
                    let db = Firestore.firestore()
                    let docRef = db.collection("doctors").document(result.user.uid)
                    docRef.setData(info) { (err) in
                        if err == nil {
                            let user = UserDefaults.standard
                            user.set(userInfo[0], forKey: "email")
                            user.set(userInfo[2], forKey: "name")
                            user.set(userInfo[3], forKey: "lastName")
                            user.set(result.user.uid, forKey: "uId")
                            user.synchronize()
                            delegate.endAnimationWith {
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: "init")
                                vc.modalPresentationStyle = .fullScreen
                                self.present(vc, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
}
