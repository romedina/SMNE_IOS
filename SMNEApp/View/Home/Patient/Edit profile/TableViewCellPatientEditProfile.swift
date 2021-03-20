//
//  TableViewCellPatientEditProfile.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 28/02/21.
//

import UIKit

class TableViewCellPatientEditProfile: UITableViewCell {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var genderInput: UITextField!
    @IBOutlet weak var typeInput: UITextField!
    @IBOutlet weak var yearInput: UITextField!
    @IBOutlet weak var racialInput: UITextField!
    @IBOutlet weak var weitghtInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var countryInput: UITextField!
    @IBOutlet weak var birthdayInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInfo() {
        let info = PatientSelected.shared.patientInfo
        nameInput.text = ""
        
        lastNameInput.text = ""
        ageInput.text = "\(info?.age ?? 0)"
        genderInput.text = info?.gender.rawValue
        typeInput.text = info?.consultationType.rawValue
        yearInput.text = "\(info?.diagnosisYear ?? 1999)"
        if info?.racialAncestry.rawValue == "afroAmerican" {
            racialInput.text = "Afroamericano"
        } else {
            racialInput.text = "No afroamericano"
        }
        weitghtInput.text = "\(info?.weight ?? 0)"
        heightInput.text = "\(info?.height ?? 0)"
        countryInput.text = info?.country
        if info?.birthDate != nil {
            birthdayInput.text = "\(info?.birthDate! ?? Date())"
        } else {
            birthdayInput.text = ""
        }
    }

}
