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
    func infoChanged(email: String, pass: String)
    func otherLogin(type: TableViewCellLogin.LoginType)
    
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
    var flags = [false, false]
    
    enum LoginType {
        case apple
        case google
        case facebook
    }
    
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
        appleLoginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        
        gmailLoginButton.setBackgroundColor(.white)
        gmailLoginButton.setBorderWidth(1.0, for: .normal)
        gmailLoginButton.setBorderColor(.C00D9CC(), for: .normal)
        gmailLoginButton.layer.cornerRadius = 8
        gmailLoginButton.setImage(#imageLiteral(resourceName: "google"), for: .normal)
        gmailLoginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        
        facebookLoginButton.setBackgroundColor(.white)
        facebookLoginButton.setBorderWidth(1.0, for: .normal)
        facebookLoginButton.setBorderColor(.C00D9CC(), for: .normal)
        facebookLoginButton.layer.cornerRadius = 8
        facebookLoginButton.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        facebookLoginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        
        validateTextNotEmpty()
    }
    
    @objc func passChangeView() {
        passwordInput.isSecureTextEntry.toggle()
        if passwordInput.isSecureTextEntry {
            rightButton.setImage(UIImage(named: "eye.fill"), for: .normal)
        } else {
            rightButton.setImage(#imageLiteral(resourceName: "crossEye"), for: .normal)
        }
    }
    
    @IBAction func emailChanged(_ sender: MDCTextField) {
        if sender.text != "" && sender.text != nil {
            flags[0] = true
        } else {
            flags[0] = false
        }
        validateTextNotEmpty()
    }
    
    @IBAction func passChanged(_ sender: MDCTextField) {
        if sender.text != "" && sender.text != nil {
            flags[1] = true
        } else {
            flags[1] = false
        }
        validateTextNotEmpty()
    }
    
    @IBAction func appleLogin(_ sender: Any) {
        delegate?.otherLogin(type: .apple)
    }
    @IBAction func googleLogin(_ sender: Any) {
        delegate?.otherLogin(type: .google)
    }
    
    func validateTextNotEmpty() {
        if flags[0] && flags[1] {
            loginButton.isEnabled = true
            loginButton.backgroundColor?.withAlphaComponent(1.0)
            delegate?.infoChanged(email: emailInput.text!, pass: passwordInput.text!)
        } else {
            loginButton.backgroundColor?.withAlphaComponent(0.61)
            loginButton.isEnabled = false
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        delegate?.loginTapped()
    }
}
