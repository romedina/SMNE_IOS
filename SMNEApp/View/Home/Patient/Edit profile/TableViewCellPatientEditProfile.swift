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
    @IBOutlet weak var yearInput: UITextField!
    @IBOutlet weak var weitghtInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var countryInput: UITextField!
    @IBOutlet weak var birthdayInput: UITextField!
    
    @IBOutlet weak var publicButton: UIButton!
    @IBOutlet weak var privateButton: UIButton!
    @IBOutlet weak var femButton: UIButton!
    @IBOutlet weak var mascButton: UIButton!
    @IBOutlet weak var notAfroButton: UIButton!
    @IBOutlet weak var afroButton: UIButton!
    
    @IBOutlet weak var typeView: UIStackView!
    @IBOutlet weak var genderView: UIStackView!
    @IBOutlet weak var racialView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        typeView.layer.borderWidth = 1
        typeView.layer.borderColor = UIColor.C5FD6CB().cgColor
        typeView.layer.cornerRadius = 8
        
        genderView.layer.borderWidth = 1
        genderView.layer.borderColor = UIColor.C5FD6CB().cgColor
        genderView.layer.cornerRadius = 8
        
        racialView.layer.borderWidth = 1
        racialView.layer.borderColor = UIColor.C5FD6CB().cgColor
        racialView.layer.cornerRadius = 8
    }
    
    func setInfo() {
        let info = PatientSelected.shared.patientInfo
        nameInput.text = info?.name
        
        lastNameInput.text = info?.lastName
        ageInput.text = "\(info?.age ?? 0)"
        yearInput.text = "\(info?.diagnosisYear ?? 1999)"
        if info?.racialAncestry.rawValue == "afroAmerican" {
            afroButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        } else {
            notAfroButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        }
        
        if info?.gender.rawValue == "male" {
            mascButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        } else {
            femButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        }
        
        if info?.consultationType.rawValue == "public" {
            publicButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        } else {
            privateButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
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
    
    @IBAction func publicTapped(_ sender: Any) {
        publicButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        privateButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        PatientSelected.shared.patientInfo?.consultationType = .publica
    }
    @IBAction func privateTapped(_ sender: Any) {
        privateButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        publicButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        PatientSelected.shared.patientInfo?.consultationType = .privada
    }
    @IBAction func femTipped(_ sender: Any) {
        femButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        mascButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        PatientSelected.shared.patientInfo?.gender = .fem
    }
    @IBAction func mascTapped(_ sender: Any) {
        mascButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        femButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        PatientSelected.shared.patientInfo?.gender = .mas
    }
    @IBAction func notAfroTapped(_ sender: Any) {
        notAfroButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        afroButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        PatientSelected.shared.patientInfo?.racialAncestry = .No
    }
    @IBAction func afroTapped(_ sender: Any) {
        afroButton.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        notAfroButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        PatientSelected.shared.patientInfo?.racialAncestry = .Afroamericano
    }
    @IBAction func nameChanged(_ sender: UITextField) {
        PatientSelected.shared.patientInfo?.name = sender.text ?? ""
    }
    @IBAction func lastChanged(_ sender: UITextField) {
        PatientSelected.shared.patientInfo?.lastName = sender.text ?? ""
    }
    @IBAction func ageChanged(_ sender: UITextField) {
        PatientSelected.shared.patientInfo?.age = Int(sender.text ?? "0") ?? 0
    }
    @IBAction func diabetesYearChanged(_ sender: UITextField) {
        PatientSelected.shared.patientInfo?.diagnosisYear = Int(sender.text ?? "0") ?? 0
    }
    @IBAction func weightChanged(_ sender: UITextField) {
        PatientSelected.shared.patientInfo?.weight = Double(sender.text ?? "0") ?? 0
    }
    @IBAction func heightChanged(_ sender: UITextField) {
        PatientSelected.shared.patientInfo?.height = Double(sender.text ?? "0") ?? 0
    }
    @IBAction func countryChanged(_ sender: UITextField) {
        PatientSelected.shared.patientInfo?.country = sender.text ?? ""
    }
    

}
