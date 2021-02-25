//
//  TableViewCellLogin.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import MaterialComponents

protocol LoginCellDelegate {
    func loginTapped()
}

class TableViewCellLogin: UITableViewCell {

    @IBOutlet weak var emailInput: MDCTextField!
    @IBOutlet weak var passwordInput: MDCTextField!
    
    @IBOutlet weak var forgotPassButton: MDCButton!
    @IBOutlet weak var registerButton: MDCButton!
    @IBOutlet weak var appleLoginButton: MDCButton!
    @IBOutlet weak var gmailLoginButton: MDCButton!
    @IBOutlet weak var facebookLoginButton: MDCButton!
    @IBOutlet weak var loginButton: MDCButton!
    
    var emailController: MDCTextInputControllerOutlined?
    var passController: MDCTextInputControllerOutlined?
    
    let rightButton = UIButton(type: .custom)
    
    var appleImage = UIImage()
    var faceboolImage = UIImage()
    var googleImage = UIImage()
    
    var delegate: LoginCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        emailController = MDCTextInputControllerOutlined(textInput: emailInput)
        passController = MDCTextInputControllerOutlined(textInput: passwordInput)
        
        emailController?.applyTheme(withScheme: appTheme)
        passController?.applyTheme(withScheme: appTheme)
        
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        rightButton.addTarget(self, action: #selector(passChangeView), for: .touchUpInside)
        rightButton.setImage(UIImage(named: "eye.fill"), for: .normal)
        rightButton.tintColor = .C052D6C()
        
        passwordInput.trailingView = rightButton
        passwordInput.trailingViewMode = .always
        
        
        forgotPassButton.setBackgroundColor(.white)
        registerButton.setBackgroundColor(.white)
        
        loginButton.layer.cornerRadius = 8
        
        appleLoginButton.setBackgroundColor(.white)
        appleLoginButton.setBorderWidth(1.0, for: .normal)
        appleLoginButton.setBorderColor(.C00D9CC(), for: .normal)
        appleLoginButton.layer.cornerRadius = 8
        appleLoginButton.setImage(#imageLiteral(resourceName: "apple"), for: .normal)
        
        gmailLoginButton.setBackgroundColor(.white)
        gmailLoginButton.setBorderWidth(1.0, for: .normal)
        gmailLoginButton.setBorderColor(.C00D9CC(), for: .normal)
        gmailLoginButton.layer.cornerRadius = 8
        gmailLoginButton.setImage(#imageLiteral(resourceName: "google"), for: .normal)
        
        facebookLoginButton.setBackgroundColor(.white)
        facebookLoginButton.setBorderWidth(1.0, for: .normal)
        facebookLoginButton.setBorderColor(.C00D9CC(), for: .normal)
        facebookLoginButton.layer.cornerRadius = 8
        facebookLoginButton.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        
    }
    
    @objc func passChangeView() {
        passwordInput.isSecureTextEntry.toggle()
        if passwordInput.isSecureTextEntry {
            rightButton.setImage(UIImage(named: "eye.fill"), for: .normal)
        } else {
            rightButton.setImage(#imageLiteral(resourceName: "crossEye"), for: .normal)
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        delegate?.loginTapped()
    }
}
