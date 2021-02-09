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

}
