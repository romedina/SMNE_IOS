//
//  TableViewCellRegister.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import MaterialComponents

class TableViewCellRegister: UITableViewCell {

    @IBOutlet weak var nameInput: MDCOutlinedTextField!
    @IBOutlet weak var surnameInput: MDCOutlinedTextField!
    @IBOutlet weak var emailInput: MDCOutlinedTextField!
    @IBOutlet weak var passwordInput: MDCOutlinedTextField!
    @IBOutlet weak var confirmPasswordInput: MDCOutlinedTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameInput.applyTheme(withScheme: appTheme)
        
        surnameInput.setOutlineColor(.C2(), for: .normal)
        
        emailInput.setOutlineColor(.C2(), for: .normal)
        
        passwordInput.setOutlineColor(.C2(), for: .normal)
        
        confirmPasswordInput.setOutlineColor(.C2(), for: .normal)
    }

}
