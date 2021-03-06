//
//  FirebaseViewModel.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 01/03/21.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseViewModel {
    
    var db = Firestore.firestore()
    var docRef: DocumentReference?
    
    init() {
        let docId = UserDefaults.standard.string(forKey: "uId")
        if docId != nil {
            docRef = db.collection("doctors").document(docId!)
        }
    }
    
    func setPatient(info: [String: Any]) -> Bool{
        var flag = false
        if docRef == nil {
            print("Hubo un error al cargar.")
            return false
        }
        let patientDoc = docRef?.collection("patients").document()
        patientDoc?.setData(info, completion: { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            flag = true
        })
        return flag
    }
    
    func createDictionary(patientInfo: PatientSchema) -> [String: Any] {
        var patient = patientInfo
        var dict: [String: Any] = [:]
        let time = Timestamp()
        dict["age"] = patientInfo.age
        dict["birthDate"] = patientInfo.birthDate
        dict["consultationType"] = patientInfo.consultationType.rawValue
        dict["country"] = patientInfo.country
        dict["createdAt"] = time
        dict["diagnosisYear"] = patientInfo.diagnosisYear
        dict["gender"] = patientInfo.gender.rawValue
        dict["height"] = patientInfo.height
        dict["racialAncestry"] = patientInfo.racialAncestry.rawValue
        dict["updatedAt"] = patientInfo.updatedAt
        dict["weight"] = patientInfo.weight
        dict["currentEvaluation"] = 1
        dict["currentTreatment"] = patientInfo.currentTreatment.rawValue
        
        let patientEv = patientInfo.evaluations[0]
        var evaluations: [String: Any] = [:]
        evaluations["age"] = patientEv.age
        evaluations["cardiovascularComplications"] = patientEv.cardiovascularComplications
        evaluations["chronicKidneyDisease"] = patientEv.chronicKidneyDisease
        evaluations["consultationType"] = patientEv.consultationType.rawValue
        evaluations["createdAt"] = time
        evaluations["creatinineLevels"] = patientEv.creatinineLevels
        evaluations["diagnosisYear"] = patientEv.diagnosisYear
        evaluations["estimatedGlomerularFiltrationRate"] = patientEv.estimatedGlomerularFiltrationRate.rawValue
        evaluations["fastingGlucose"] = patientEv.fastingGlucose
        evaluations["gender"] = patientEv.gender.rawValue
        evaluations["glycosylatedHemoglobin"] = patientEv.glycosylatedHemoglobin
        evaluations["height"] = patientEv.height
        evaluations["hypoglycemia"] = patientEv.hypoglycemia
        evaluations["imc"] = patientEv.imc
        evaluations["racialAncestry"] = patientEv.racialAncestry.rawValue
        evaluations["treatment"] = patientEv.treatment.rawValue
        evaluations["weight"] = patientEv.weight
        
        var comment: [String: Any] = [:]
        comment["createdAt"] = patientEv.observations[0].createdAt
        comment["content"] = patientEv.observations[0].content
        
        evaluations["observations"] = [comment]
        
        dict["evaluations"] = [evaluations]
        
        print(dict)
        return dict
    }
}
