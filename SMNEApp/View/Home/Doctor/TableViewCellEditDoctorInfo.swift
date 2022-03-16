//
//  TableViewCellEditDoctorInfo.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/02/21.
//

import UIKit

class TableViewCellEditDoctorInfo: UITableViewCell {
    
    
    @IBOutlet weak var nameInput: SMNETextField!
    @IBOutlet weak var fSurnameInput: SMNETextField!
    @IBOutlet weak var sSurnameInput: SMNETextField!
    @IBOutlet weak var emailInput: SMNETextField!
    @IBOutlet weak var cedulaInput: SMNETextField!
    @IBOutlet weak var espeInput: SMNETextField!
    @IBOutlet weak var schoolInput: SMNETextField!
    @IBOutlet weak var countryInput: SMNETextField!
    @IBOutlet weak var femButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    let user = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameInput.setTextFieldLook()
        fSurnameInput.setTextFieldLook()
        sSurnameInput.setTextFieldLook()
        emailInput.setTextFieldLook()
        cedulaInput.setTextFieldLook()
        espeInput.setTextFieldLook()
        schoolInput.setTextFieldLook()
        countryInput.setTextFieldLook()
        setTextInfo()
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
            switch info {
            case "female":
                femButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
            case "male":
                maleButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
            default:
                break
            }
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
    
    @IBAction func nameChanged(_ sender: UITextField) {
        user.set(sender.text ?? "", forKey: "newName")
    }
    @IBAction func fSurnameChanged(_ sender: UITextField) {
        user.set(sender.text ?? "", forKey: "newfSur")
    }
    @IBAction func sSurnameChanged(_ sender: UITextField) {
        user.set(sender.text ?? "", forKey: "newsSur")
    }
    @IBAction func emailChanged(_ sender: UITextField) {
        user.set(sender.text ?? "", forKey: "newemail")
    }
    @IBAction func cedulaChanged(_ sender: UITextField) {
        user.set(sender.text ?? "", forKey: "newCedula")
    }
    @IBAction func espeChanged(_ sender: UITextField) {
        user.set(sender.text ?? "", forKey: "newespe")
    }
    @IBAction func schoolChanged(_ sender: UITextField) {
        user.set(sender.text ?? "", forKey: "newschool")
    }
    @IBAction func countryChanged(_ sender: UITextField) {
        user.set(sender.text ?? "", forKey: "newCountry")
    }
    @IBAction func femTapped(_ sender: Any) {
        user.set("female", forKey: "newgender")
        femButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        maleButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
    }
    @IBAction func maleTapped(_ sender: Any) {
        user.set("male", forKey: "newgender")
        maleButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        femButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
    }
    

}
