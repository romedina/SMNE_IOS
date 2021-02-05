//
//  ViewControllerNPMain.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 29/01/21.
//

import UIKit
import MaterialComponents.MDCButton

class ViewControllerNPMain: UIViewController {
    
    var pageViewCotroller: ViewControllerNPPageView!
    @IBOutlet weak var returnButton: MDCButton!
    @IBOutlet weak var nextButton: MDCButton!
    
    var index = 0
    
    var patientInfo: PatientInfo = PatientInfo(id: "", date: "", type: "Privada", age: 0, gender: "Masculino", racial: false, diabetesDate: "", IMC: 0, renal: false, cardio: false, hipo: false)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        returnButton.setBorderColor(.C2(), for: .normal)
        returnButton.setBorderWidth(1, for: .normal)
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        let dateIng = formatter1.string(from: today)
        
        let dateSeparated = dateIng.split(separator: "/")
        let dateMX = "\(dateSeparated[1])/\(dateSeparated[0])/\(dateSeparated[2])"
        patientInfo.date = dateMX
        
        let S1 = pageViewCotroller.subViewControllers[0] as! TableViewControllerNewPatient_S1
        S1.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PVCMainSegue" {
            if segue.destination.isKind(of: ViewControllerNPPageView.self) {
                pageViewCotroller = (segue.destination as! ViewControllerNPPageView)
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: MDCButton) {
        print(patientInfo)
        if patientInfo.age != 0 && patientInfo.diabetesDate != "" {
            if index < 4 {
                index += 1
                pageViewCotroller.setViewControllerFromIndex(index: index)
            }
        } else {
            print("Registra todo")
        }
        
    }
    
    @IBAction func returnButtonTapped(_ sender: MDCButton) {
        if index == 0 {
            self.dismiss(animated: true, completion: nil)
        }
        if index > 0 {
            index -= 1
            pageViewCotroller.setViewControllerFromIndex(index: index)
        }
    }
    
}

extension ViewControllerNPMain: InfoChangedS1Delegate {
    func infoChanged(id: String, info: Any) {
        print(id)
        print(info)
        switch id {
        case "type":
            patientInfo.type = info as! String
            break
        case "age":
            patientInfo.age = Int(info as! String) ?? 0
            break
        case "gender":
            patientInfo.gender = info as! String
            break
        case "racial":
            let racial =  info as! String == "Afroamericano" ? true: false
            patientInfo.racial = racial
            break
        case "diabetes":
            patientInfo.diabetesDate = info as! String
            break
        default:
            break
        }
    }
}
