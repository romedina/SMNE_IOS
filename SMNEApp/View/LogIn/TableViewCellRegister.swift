//
//  TableViewCellRegister.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import MaterialComponents

class TableViewCellRegister: UITableViewCell {

    @IBOutlet weak var nameInput: MDCTextField!
    @IBOutlet weak var surnameInput: MDCTextField!
    @IBOutlet weak var emailInput: MDCTextField!
    @IBOutlet weak var passwordInput: MDCTextField!
    @IBOutlet weak var confirmPasswordInput: MDCTextField!
    @IBOutlet weak var acceptTermsButton: UIButton!
    @IBOutlet weak var goToTermsButton: UIButton!
    
    var nameController: MDCTextInputControllerOutlined?
    var surnameController: MDCTextInputControllerOutlined?
    var emailController: MDCTextInputControllerOutlined?
    var passController: MDCTextInputControllerOutlined?
    var confController: MDCTextInputControllerOutlined?
    
    var delegate: RegisterDelegate?
    
    let rightButton = UIButton(type: .custom)
    let rightButtonconfirm = UIButton(type: .custom)
    
    var checkImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "check")?.withRenderingMode(.alwaysOriginal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameController = MDCTextInputControllerOutlined(textInput: nameInput)
        surnameController = MDCTextInputControllerOutlined(textInput: surnameInput)
        emailController = MDCTextInputControllerOutlined(textInput: emailInput)
        passController = MDCTextInputControllerOutlined(textInput: passwordInput)
        confController = MDCTextInputControllerOutlined(textInput: confirmPasswordInput)
        
        nameController?.applyTheme(withScheme: appTheme)
        surnameController?.applyTheme(withScheme: appTheme)
        emailController?.applyTheme(withScheme: appTheme)
        passController?.applyTheme(withScheme: appTheme)
        confController?.applyTheme(withScheme: appTheme)
        
        self.contentView.addSubview(checkImageView)
        
        NSLayoutConstraint.activate([
            checkImageView.centerYAnchor.constraint(equalTo: acceptTermsButton.centerYAnchor),
            checkImageView.centerXAnchor.constraint(equalTo: acceptTermsButton.centerXAnchor),
            checkImageView.heightAnchor.constraint(equalToConstant: 30),
            checkImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        acceptTermsButton.layer.cornerRadius = 8
        acceptTermsButton.layer.borderWidth = 2
        acceptTermsButton.layer.borderColor = UIColor.C00D9CC().cgColor
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Open Sans Bold", size: 15.0) ?? UIFont.systemFont(ofSize: 15.0),
            .foregroundColor: UIColor.C00D9CC(),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
            string: "Acepto términos y condiciones",
            attributes: yourAttributes
        )
        goToTermsButton.setAttributedTitle(attributeString, for: .normal)
        
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        rightButton.addTarget(self, action: #selector(passChangeView), for: .touchUpInside)
        rightButton.setImage(UIImage(named: "eye"), for: .normal)
        rightButton.imageView?.contentMode = .scaleAspectFit
        rightButton.tintColor = .C052D6C()
        
        passwordInput.trailingView = rightButton
        passwordInput.trailingViewMode = .always
        
        rightButtonconfirm.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        rightButtonconfirm.addTarget(self, action: #selector(passChangeView), for: .touchUpInside)
        rightButtonconfirm.setImage(UIImage(named: "eye"), for: .normal)
        rightButtonconfirm.imageView?.contentMode = .scaleAspectFit
        rightButtonconfirm.tintColor = .C052D6C()
        
        confirmPasswordInput.trailingView = rightButtonconfirm
        confirmPasswordInput.trailingViewMode = .always
        
    }
    
    @objc func passChangeView() {
        passwordInput.isSecureTextEntry.toggle()
        confirmPasswordInput.isSecureTextEntry.toggle()
        if passwordInput.isSecureTextEntry {
            rightButton.setImage(UIImage(named: "eye"), for: .normal)
            rightButtonconfirm.setImage(UIImage(named: "eye"), for: .normal)
        } else {
            rightButton.setImage(#imageLiteral(resourceName: "crossEye"), for: .normal)
            rightButtonconfirm.setImage(#imageLiteral(resourceName: "crossEye"), for: .normal)
        }
    }

    @IBAction func nameChanged(_ sender: UITextField) {
        if sender.text != nil && sender.text != "" {
            delegate?.infoChanged(id: "name", data: sender.text!)
        }
    }
    
    @IBAction func surnameChanged(_ sender: UITextField) {
        if sender.text != nil && sender.text != "" {
            delegate?.infoChanged(id: "lastName", data: sender.text!)
        }
    }
    
    @IBAction func emailChanged(_ sender: MDCTextField) {
        if !sender.isValidEmail() {
            emailController?.setErrorText("Email inválido.", errorAccessibilityValue: nil)
        } else {
            emailController?.setErrorText(nil, errorAccessibilityValue: nil)
            delegate?.infoChanged(id: "email", data: sender.text!)
        }
    }
    
    @IBAction func passChanged(_ sender: UITextField) {
        if sender.text != nil && sender.text != "" {
            if confirmPasswordInput.text != nil && confirmPasswordInput.text != "" {
                if sender.text == confirmPasswordInput.text {
                    delegate?.infoChanged(id: "pass", data: sender.text!)
                }
            }
        }
    }
    
    @IBAction func confPassChanged(_ sender: UITextField) {
        if sender.text != nil && sender.text != "" {
            if passwordInput.text != nil && passwordInput.text != "" {
                if sender.text == passwordInput.text {
                    delegate?.infoChanged(id: "pass", data: sender.text!)
                    confController?.setErrorText(nil, errorAccessibilityValue: nil)
                } else {
                    confController?.setErrorText("No coinciden las contraseñas", errorAccessibilityValue: nil)
                }
            }
        }
    }
    
    @IBAction func termsTapped(_ sender: Any) {
        delegate?.openTerms()
    }
    
    @IBAction func acceptTermsTapped(_ sender: Any) {
        checkImageView.isHidden.toggle()
        delegate?.activeRegisterButton(isActive: !checkImageView.isHidden)
    }
}
