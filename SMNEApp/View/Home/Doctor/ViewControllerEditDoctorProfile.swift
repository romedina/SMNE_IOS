//
//  ViewControllerEditDoctorProfile.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/02/21.
//

import UIKit
import FirebaseFirestore

class ViewControllerEditDoctorProfile: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        saveButton.layer.cornerRadius = 8
        
    }
    
    @IBAction func returnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        let user = UserDefaults.standard
        let db = Firestore.firestore()
        guard let uId = user.string(forKey: "uId") else { return }
        let docRef = db.collection("doctors").document(uId)
        
        
        let newName = user.string(forKey: "newName")
        let newLast = "\(user.string(forKey: "newfSur")!) \(user.string(forKey: "newsSur")!)"
        let newGender = user.string(forKey: "newgender")
        let newemail = user.string(forKey: "newemail")
        let newCedula = user.string(forKey: "newCedula")
        let newespe = user.string(forKey: "newespe")
        let newschool = user.string(forKey: "newschool")
        let newcountry = user.string(forKey: "newCountry")
        
        var info: [String: Any] = [:]
        info["name"] = newName
        info["lastName"] = newLast
        info["gender"] = newGender
        info["email"] = newemail
        info["professionalLicense"] = newCedula
        info["specialty"] = newespe
        info["MedicineSchool"] = newschool
        info["country"] = newcountry
        info["updatedAt"] = Timestamp()
        
        docRef.updateData(info) { (err) in
            if err == nil {
                let user = UserDefaults.standard
                user.set(newemail, forKey: "email")
                user.set(newName, forKey: "name")
                user.set(newLast, forKey: "lastName")
                user.set(newGender, forKey: "gender")
                user.set(newCedula, forKey: "cedula")
                user.set(newespe, forKey: "espe")
                user.set(newschool, forKey: "school")
                user.set(newcountry, forKey: "country")
                
                user.removeObject(forKey: "newName")
                user.removeObject(forKey: "newfSur")
                user.removeObject(forKey: "newsSur")
                user.removeObject(forKey: "newgender")
                user.removeObject(forKey: "newemail")
                user.removeObject(forKey: "newCedula")
                user.removeObject(forKey: "newespe")
                user.removeObject(forKey: "newschool")
                user.removeObject(forKey: "newCountry")
                user.synchronize()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
