//
//  TableViewCellLogin.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import MaterialComponents

class TableViewCellLogin: UITableViewCell {

    @IBOutlet weak var emailInput: MDCTextField!
    @IBOutlet weak var passwordInput: MDCTextField!
    
    var emailController: MDCTextInputControllerOutlined?
    var passController: MDCTextInputControllerOutlined?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        emailController = MDCTextInputControllerOutlined(textInput: emailInput)
        passController = MDCTextInputControllerOutlined(textInput: passwordInput)
        
        emailController?.applyTheme(withScheme: appTheme)
        passController?.applyTheme(withScheme: appTheme)
    }

}
