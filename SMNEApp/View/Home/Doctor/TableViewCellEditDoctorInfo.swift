//
//  TableViewCellEditDoctorInfo.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/02/21.
//

import UIKit
import MaterialComponents

class TableViewCellEditDoctorInfo: UITableViewCell {
    
    
    @IBOutlet weak var nameInput: MDCTextField!
    @IBOutlet weak var fSurnameInput: MDCTextField!
    @IBOutlet weak var sSurnameInput: MDCTextField!
    @IBOutlet weak var genderInput: MDCTextField!
    @IBOutlet weak var emailInput: MDCTextField!
    @IBOutlet weak var cedulaInput: MDCTextField!
    @IBOutlet weak var espeInput: MDCTextField!
    @IBOutlet weak var schoolInput: MDCTextField!
    @IBOutlet weak var countryInput: MDCTextField!
    
    var nameController: MDCTextInputControllerOutlined?
    var fLastController: MDCTextInputControllerOutlined?
    var sLastController: MDCTextInputControllerOutlined?
    var genderController: MDCTextInputControllerOutlined?
    var emailController: MDCTextInputControllerOutlined?
    var cedulaController: MDCTextInputControllerOutlined?
    var espeController: MDCTextInputControllerOutlined?
    var schoolController: MDCTextInputControllerOutlined?
    var countryController: MDCTextInputControllerOutlined?
    
    let user = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nameController = MDCTextInputControllerOutlined(textInput: nameInput)
        fLastController = MDCTextInputControllerOutlined(textInput: fSurnameInput)
        sLastController = MDCTextInputControllerOutlined(textInput: sSurnameInput)
        genderController = MDCTextInputControllerOutlined(textInput: genderInput)
        emailController = MDCTextInputControllerOutlined(textInput: emailInput)
        cedulaController = MDCTextInputControllerOutlined(textInput: cedulaInput)
        espeController = MDCTextInputControllerOutlined(textInput: espeInput)
        schoolController = MDCTextInputControllerOutlined(textInput: schoolInput)
        countryController = MDCTextInputControllerOutlined(textInput: countryInput)
        
        nameController?.applyTheme(withScheme: appTheme)
        fLastController?.applyTheme(withScheme: appTheme)
        sLastController?.applyTheme(withScheme: appTheme)
        genderController?.applyTheme(withScheme: appTheme)
        emailController?.applyTheme(withScheme: appTheme)
        cedulaController?.applyTheme(withScheme: appTheme)
        espeController?.applyTheme(withScheme: appTheme)
        schoolController?.applyTheme(withScheme: appTheme)
        countryController?.applyTheme(withScheme: appTheme)
        
//        setTextBorder(input: nameInput)
//        setTextBorder(input: fSurnameInput)
//        setTextBorder(input: sSurnameInput)
//        setTextBorder(input: genderInput)
//        setTextBorder(input: emailInput)
//        setTextBorder(input: cedulaInput)
//        setTextBorder(input: espeInput)
//        setTextBorder(input: schoolInput)
//        setTextBorder(input: countryInput)
        
        setTextInfo()
    }
    
    func setTextBorder(input: UITextField) {
        input.layer.borderColor = UIColor.C5FD6CB().cgColor
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 10
    }
    
    func setTextInfo() {
        let user = UserDefaults.standard
        if let info = user.string(forKey: "name") {
            nameInput.text = info
            user.set(info, forKey: "newName")
        }
        if let info = user.string(forKey: "lastName") {
            let complete = info.split(separator: " ")
            for i in complete {
                if i == complete.first {
                    user.set(String(i), forKey: "newfSur")
                    fSurnameInput.text = String(i)
                } else {
                    user.set(String(i), forKey: "newsSur")
                    sSurnameInput.text = String(i)
                }
            }
        }
        if let info = user.string(forKey: "email") {
            user.set(info, forKey: "newemail")
            emailInput.text = info
        }
        if let info = user.string(forKey: "gender") {
            user.set(info, forKey: "newgender")
            genderInput.text = info
        }
        if let info = user.string(forKey: "cedula") {
            user.set(info, forKey: "newCedula")
            cedulaInput.text = info
        }
        if let info = user.string(forKey: "espe") {
            user.set(info, forKey: "newespe")
            espeInput.text = info
        }
        if let info = user.string(forKey: "school") {
            user.set(info, forKey: "newschool")
            schoolInput.text = info
        }
        if let info = user.string(forKey: "country") {
            user.set(info, forKey: "newCountry")
            countryInput.text = info
        }
    }
    
    @IBAction func nameChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newName")
    }
    @IBAction func fSurnameChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newfSur")
    }
    @IBAction func sSurnameChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newsSur")
    }
    @IBAction func genderChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newgender")
    }
    @IBAction func emailChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newemail")
    }
    @IBAction func cedulaChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newCedula")
    }
    @IBAction func espeChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newespe")
    }
    @IBAction func schoolChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newschool")
    }
    @IBAction func countryChanged(_ sender: MDCTextField) {
        user.set(sender.text ?? "", forKey: "newCountry")
    }
    

}
