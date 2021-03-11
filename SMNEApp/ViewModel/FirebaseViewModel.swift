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
    var colRef: CollectionReference?
    var patientsRef: CollectionReference?
    
    init() {
        let docId = UserDefaults.standard.string(forKey: "uId")
        colRef = db.collection("doctors")
        if docId != nil {
            docRef = db.collection("doctors").document(docId!)
            patientsRef = docRef?.collection("patients")
        }
    }
    
    func setPatient(info: [String: Any], handler: @escaping ()->Void) -> Bool{
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
            handler()
        })
        return flag
    }
    
    func createDictionary(patientInfo: PatientSchema) -> [String: Any] {
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
    
    func getPatients(handler: @escaping (_ patients: [PatientSchema])->Void){
        var patients = [PatientSchema]()
        patientsRef!.getDocuments { (documents, err) in
            if err == nil && documents != nil {
                for i in documents!.documents {
                    let patient = PatientSchema(pId: i.documentID,
                                                age: i.get("age") as? Int ?? 0,
                                                birthDate: nil,
                                                consultationType: ConsultationEnum(rawValue: i.get("consultationType") as? String ?? ConsultationEnum.privada.rawValue)!,
                                                country: i.get("country") as? String ?? "",
                                                createdAt: i.get("createdAt") as? Timestamp ?? Timestamp(),
                                                diagnosisYear: i.get("diagnosisYear") as? Int ?? 0,
                                                gender: GenderEnum(rawValue: i.get("gender") as? String ?? "") ?? GenderEnum.fem,
                                                height: i.get("height") as? Double ?? 0.0,
                                                racialAncestry: RacialEnum(rawValue: i.get("racialAncestry") as? String ?? RacialEnum.No.rawValue)!,
                                                updatedAt: i.get("updatedAt") as? Timestamp ?? Timestamp(),
                                                weight: i.get("weight") as? Double ?? 0.0,
                                                currentEvaluation: i.get("currentEvaluation") as? Int ?? 0,
                                                currentTreatment: TreatmentEnum(rawValue: i.get("currentTreatment") as? String ?? TreatmentEnum.A.rawValue)!,
                                                evaluations: []
                    )
                    patients.append(patient)
                }
                //return info here
                handler(patients)
            }
        }
    }
    
    func getDoctorDocument(uId: String, completion: @escaping () -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("doctors").document(uId)
        
        docRef.getDocument { (doc, err) in
            if doc == nil {
                print("Esto no debió de pasar")
            } else {
                let user = UserDefaults.standard
                if let name = doc?.get("name") as? String {
                    user.set(name, forKey: "name")
                }
                if let email = doc?.get("email") as? String {
                    user.set(email, forKey: "email")
                }
                if let lastName = doc?.get("lastName") as? String {
                    user.set(lastName, forKey: "lastName")
                }
                if let lastName = doc?.get("country") as? String {
                    user.set(lastName, forKey: "country")
                }
                if let lastName = doc?.get("gender") as? String {
                    user.set(lastName, forKey: "gender")
                }
                if let lastName = doc?.get("professionalLicense") as? String {
                    user.set(lastName, forKey: "cedula")
                }
                if let lastName = doc?.get("specialty") as? String {
                    user.set(lastName, forKey: "espe")
                }
                if let lastName = doc?.get("MedicineSchool") as? String {
                    user.set(lastName, forKey: "school")
                }
                
                user.set(uId, forKey: "uId")
                user.synchronize()
                
                completion()
            }
        }
    }
}
