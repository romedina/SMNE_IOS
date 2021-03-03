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
    
    var nameController: MDCTextInputControllerOutlined?
    var surnameController: MDCTextInputControllerOutlined?
    var emailController: MDCTextInputControllerOutlined?
    var passController: MDCTextInputControllerOutlined?
    var confController: MDCTextInputControllerOutlined?
    
    var delegate: RegisterDelegate?
    
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
}
