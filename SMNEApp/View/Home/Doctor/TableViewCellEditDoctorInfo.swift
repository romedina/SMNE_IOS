//
//  TableViewCellEditDoctorInfo.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/02/21.
//

import UIKit
import MaterialComponents

class TableViewCellEditDoctorInfo: UITableViewCell {
    
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var fSurnameInput: UITextField!
    @IBOutlet weak var sSurnameInput: UITextField!
    @IBOutlet weak var genderInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var cedulaInput: UITextField!
    @IBOutlet weak var espeInput: UITextField!
    @IBOutlet weak var schoolInput: UITextField!
    @IBOutlet weak var countryInput: UITextField!
    
    let user = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setTextBorder(input: nameInput)
        setTextBorder(input: fSurnameInput)
        setTextBorder(input: sSurnameInput)
        setTextBorder(input: genderInput)
        setTextBorder(input: emailInput)
        setTextBorder(input: cedulaInput)
        setTextBorder(input: espeInput)
        setTextBorder(input: schoolInput)
        setTextBorder(input: countryInput)
        
        setTextInfo()
    }
    
    func setTextBorder(input: UITextField) {
        input.layer.borderColor = UIColor.C5FD6CB().cgColor
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 10
        input.textColor = .C052D6C()
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
