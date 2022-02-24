//
//  TableViewCellRegister.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import MaterialComponents

class TableViewCellRegister: UITableViewCell {

    @IBOutlet weak var nameInput: SMNETextField!
    @IBOutlet weak var surnameInput: SMNETextField!
    @IBOutlet weak var emailInput: SMNETextField!
    @IBOutlet weak var passwordInput: SMNETextField!
    @IBOutlet weak var confirmPasswordInput: SMNETextField!
    @IBOutlet weak var acceptTermsButton: UIButton!
    @IBOutlet weak var goToTermsButton: UIButton!
    
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
        
        passwordInput.rightView = rightButton
        passwordInput.rightViewMode = .always
        
        rightButtonconfirm.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        rightButtonconfirm.addTarget(self, action: #selector(passChangeView), for: .touchUpInside)
        rightButtonconfirm.setImage(UIImage(named: "eye"), for: .normal)
        rightButtonconfirm.imageView?.contentMode = .scaleAspectFit
        rightButtonconfirm.tintColor = .C052D6C()
        
        confirmPasswordInput.rightView = rightButtonconfirm
        confirmPasswordInput.rightViewMode = .always
        
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
    
    @IBAction func emailChanged(_ sender: SMNETextField) {
        if !sender.isValidEmail() {
            emailInput.setErrorWith(text: "Email inválido")
        } else {
            emailInput.setNormal()
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
                    confirmPasswordInput.setNormal()
                } else {
                    confirmPasswordInput.setErrorWith(text: "No coinciden las contraseñas")
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
