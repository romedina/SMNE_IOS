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
    var patientDoc: DocumentReference?
    
    init() {
        let docId = UserDefaults.standard.string(forKey: "uId")
        colRef = db.collection("doctors")
        if docId != nil {
            docRef = db.collection("doctors").document(docId!)
            patientsRef = docRef?.collection("patients")
            patientDoc = docRef?.collection("patients").document()
        }
    }
    
    func setPatient(info: [String: Any], patientId: String, handler: @escaping ()->Void) -> Bool{
        var flag = false
        if docRef == nil {
            print("Hubo un error al cargar.")
            return false
        }
        if let pid = PatientSelected.shared.patientInfo?.pId {
            patientDoc = docRef?.collection("patients").document(pid)
        }
        patientDoc?.setData(info, merge: true, completion: { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            flag = true
            handler()
        })
        return flag
    }
    
    func createDictionary(patientInfo: PatientSchema, dose: String) -> [String: Any] {
        if PatientSelected.shared.patientInfo == nil {
            var dict: [String: Any] = [:]
            let time = Timestamp()
            dict["age"] = patientInfo.age
            dict["name"] = patientInfo.name
            dict["lastName"] = patientInfo.lastName
            dict["consultationType"] = patientInfo.consultationType.rawValue
            dict["country"] = patientInfo.country
            dict["createdAt"] = time
            dict["diagnosisYear"] = patientInfo.diagnosisYear
            dict["gender"] = patientInfo.gender.rawValue
            dict["height"] = patientInfo.evaluations.first?.height ?? 0
            dict["racialAncestry"] = patientInfo.racialAncestry.rawValue
            dict["updatedAt"] = patientInfo.updatedAt
            dict["weight"] = patientInfo.evaluations.first?.weight ?? 0
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
            evaluations["dose"] = dose
            
            var comment: [String: Any] = [:]
            comment["createdAt"] = patientEv.observations[0].createdAt
            comment["content"] = patientEv.observations[0].content
            
            evaluations["observations"] = [comment]
            
            dict["evaluations"] = [evaluations]
            return dict
        } else {
            guard let pInfo = PatientSelected.shared.patientInfo else { return [:] }
            var evaluations: [[String: Any]] = []
            for ev in pInfo.evaluations {
                var evaluation: [String: Any] = [:]
                evaluation["age"] = ev.age
                evaluation["cardiovascularComplications"] = ev.cardiovascularComplications
                evaluation["chronicKidneyDisease"] = ev.chronicKidneyDisease
                evaluation["consultationType"] = ev.consultationType.rawValue
                evaluation["createdAt"] = ev.createdAt
                evaluation["creatinineLevels"] = ev.creatinineLevels
                evaluation["diagnosisYear"] = ev.diagnosisYear
                evaluation["estimatedGlomerularFiltrationRate"] = ev.estimatedGlomerularFiltrationRate.rawValue
                evaluation["fastingGlucose"] = ev.fastingGlucose
                evaluation["gender"] = ev.gender.rawValue
                evaluation["glycosylatedHemoglobin"] = ev.glycosylatedHemoglobin
                evaluation["height"] = ev.height
                evaluation["hypoglycemia"] = ev.hypoglycemia
                evaluation["imc"] = ev.imc
                evaluation["racialAncestry"] = ev.racialAncestry.rawValue
                evaluation["treatment"] = ev.treatment.rawValue
                evaluation["weight"] = ev.weight
                evaluation["dose"] = ev.dose
                var comments = [[String: Any]]()
                for i in ev.observations {
                    var comment: [String: Any] = [:]
                    comment["createdAt"] = i.createdAt
                    comment["content"] = i.content
                    comments.append(comment)
                }
                evaluation["observations"] = comments
                evaluations.append(evaluation)
            }
            guard let patientEv = patientInfo.evaluations.last else { return [:]}
            var evaluation: [String: Any] = [:]
            evaluation["age"] = patientEv.age
            evaluation["cardiovascularComplications"] = patientEv.cardiovascularComplications
            evaluation["chronicKidneyDisease"] = patientEv.chronicKidneyDisease
            evaluation["consultationType"] = patientEv.consultationType.rawValue
            evaluation["createdAt"] = Timestamp()
            evaluation["creatinineLevels"] = patientEv.creatinineLevels
            evaluation["diagnosisYear"] = patientEv.diagnosisYear
            evaluation["estimatedGlomerularFiltrationRate"] = patientEv.estimatedGlomerularFiltrationRate.rawValue
            evaluation["fastingGlucose"] = patientEv.fastingGlucose
            evaluation["gender"] = patientEv.gender.rawValue
            evaluation["glycosylatedHemoglobin"] = patientEv.glycosylatedHemoglobin
            evaluation["height"] = patientEv.height
            evaluation["hypoglycemia"] = patientEv.hypoglycemia
            evaluation["imc"] = patientEv.imc
            evaluation["racialAncestry"] = patientEv.racialAncestry.rawValue
            evaluation["treatment"] = patientEv.treatment.rawValue
            evaluation["weight"] = patientEv.weight
            evaluation["dose"] = dose
            var comment: [String: Any] = [:]
            comment["createdAt"] = patientEv.observations.last?.createdAt
            comment["content"] = patientEv.observations.last?.content
            
            evaluation["observations"] = [comment]
            
            evaluations.append(evaluation)
            
            var dict: [String: Any] = [:]
            dict["age"] = patientInfo.age
            dict["name"] = patientInfo.name
            dict["lastName"] = patientInfo.lastName
            dict["consultationType"] = patientInfo.consultationType.rawValue
            dict["gender"] = patientInfo.gender.rawValue
            dict["height"] = patientInfo.evaluations.last?.height ?? 0
            dict["racialAncestry"] = patientInfo.racialAncestry.rawValue
            dict["updatedAt"] = Timestamp()
            dict["weight"] = patientInfo.evaluations.last?.weight ?? 0
            dict["currentEvaluation"] = evaluations.count
            dict["currentTreatment"] = patientInfo.currentTreatment.rawValue
            dict["evaluations"] = evaluations
            return dict
        }
        
    }
    
    func updatePatient(handler: @escaping (_ isError: Bool) -> Void) {
        guard let patientInfo = PatientSelected.shared.patientInfo else { return }
        var dict = [String: Any]()
        dict["age"] = patientInfo.age
        dict["name"] = patientInfo.name
        dict["lastName"] = patientInfo.lastName
        dict["consultationType"] = patientInfo.consultationType.rawValue
        dict["country"] = patientInfo.country
        dict["diagnosisYear"] = patientInfo.diagnosisYear
        dict["gender"] = patientInfo.gender.rawValue
        dict["height"] = patientInfo.height
        dict["racialAncestry"] = patientInfo.racialAncestry.rawValue
        dict["updatedAt"] = Timestamp()
        dict["weight"] = patientInfo.weight
        
        guard let dId = UserDefaults.standard.string(forKey: "uId") else { handler(true)
            return
        }
        let db = Firestore.firestore()
        let patientRef = db.collection("doctors").document(dId).collection("patients").document(patientInfo.pId)
        
        patientRef.setData(dict, merge: true) { (err) in
            if err == nil {
                handler(false)
            } else {
                handler(true)
            }
        }
    }
    
    func getPatients(handler: @escaping (_ patients: [PatientSchema])->Void){
        var patients = [PatientSchema]()
        patientsRef!.getDocuments { (documents, err) in
            if err == nil && documents != nil {
                for i in documents!.documents {
                    let data = i.data()
                    let revs = data["evaluations"] as! [[String: Any]]
                    
                    var revitions: [EvaluationSchema] = []
                    var lastDose: String = ""
//                    var observations: [ObservationSchema] = []
                    for i in revs {
                        var observations = [ObservationSchema]()
                        let observationsFromDB = i["observations"] as? [[String:Any]] ?? []
                        for ob in observationsFromDB {
                            observations.append(ObservationSchema(createdAt: ob["createdAt"] as? Timestamp ?? Timestamp(), content: ob["content"] as? String ?? ""))
                        }
                        let rev = EvaluationSchema(age: i["age"] as! Int,
                                                   cardiovascularComplications: i["cardiovascularComplications"] as? Bool ?? false,
                                                   chronicKidneyDisease: i["chronicKidneyDisease"] as? Bool ?? false,
                                                   consultationType: ConsultationEnum(rawValue: i["consultationType"] as?  String ?? "public") ?? .publica,
                                                   createdAt: i["createdAt"] as? Timestamp ?? Timestamp(),
                                                   creatinineLevels: i["creatinineLevels"] as? Double ?? 0.0,
                                                   diagnosisYear: i["diagnosisYear"] as? Int ?? 0,
                                                   dose: i["dose"] as? String ?? "",
                                                   estimatedGlomerularFiltrationRate: FiltrationEnum(rawValue: i["estimatedGlomerularFiltrationRate"] as? String ?? "NA") ?? .na,
                                                   fastingGlucose: i["fastingGlucose"] as? Double ?? 0.0,
                                                   gender: GenderEnum(rawValue: i["gender"] as? String ?? "male") ?? .mas,
                                                   glycosylatedHemoglobin: i["glycosylatedHemoglobin"] as? Float ?? 0.0,
                                                   height: i["height"] as? Double ?? 0,
                                                   hypoglycemia: i["hypoglycemia"] as? Bool ?? false,
                                                   imc: i["imc"] as? Double ?? 0.0,
                                                   racialAncestry: RacialEnum(rawValue: i["racialAncestry"] as? String ?? "notAfroAmerican") ?? .No,
                                                   treatment: TreatmentEnum(rawValue: i["treatment"] as? String ?? "") ?? .A,
                                                   weight: i["weight"] as? Double ?? 0.0,
                                                   observations: observations)
                        revitions.append(rev)
                        lastDose = rev.dose
                    }
                    let patient = PatientSchema(pId: i.documentID,
                                                age: i.get("age") as? Int ?? 0,
                                                name: i.get("name") as? String ?? "",
                                                lastName: i.get("lastName") as? String ?? "",
                                                birthDate: nil,
                                                consultationType: ConsultationEnum(rawValue: i.get("consultationType") as? String ?? ConsultationEnum.privada.rawValue)!,
                                                country: i.get("country") as? String ?? "",
                                                dose: lastDose,
                                                createdAt: i.get("createdAt") as? Timestamp ?? Timestamp(),
                                                diagnosisYear: i.get("diagnosisYear") as? Int ?? 0,
                                                gender: GenderEnum(rawValue: i.get("gender") as? String ?? "") ?? GenderEnum.fem,
                                                height: i.get("height") as? Double ?? 0.0,
                                                racialAncestry: RacialEnum(rawValue: i.get("racialAncestry") as? String ?? RacialEnum.No.rawValue) ?? .No,
                                                updatedAt: i.get("updatedAt") as? Timestamp ?? Timestamp(),
                                                weight: i.get("weight") as? Double ?? 0.0,
                                                currentEvaluation: i.get("currentEvaluation") as? Int ?? 0,
                                                currentTreatment: TreatmentEnum(rawValue: i.get("currentTreatment") as? String ?? TreatmentEnum.A.rawValue)!,
                                                evaluations: revitions
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
    
    func setNewComment(comment: String, patientId: String, handler: @escaping (_ isError: Bool)->Void) {
        let db = Firestore.firestore()
        guard let dId = UserDefaults.standard.string(forKey: "uId") else { return }
        let patientRef = db.collection("doctors").document(dId).collection("patients").document(patientId)
        patientRef.getDocument { (snapshot, err) in
            if let err = err {
                print("Algo sucedió.\n\(err.localizedDescription)")
                handler(true)
                return
            }
            if var data = snapshot?.data() {
                if var evaluations = data["evaluations"] as? [[String: Any]] {
                    var last = evaluations.popLast()
                    var newComment: [String: Any] = [:]
                    newComment["content"] = comment
                    newComment["createdAt"] = Timestamp()
                    if var lastObservations = last?["observations"] as? [[String: Any]] {
                        lastObservations.append(newComment)
                        last?["observations"] = lastObservations
                    } else {
                        last?["observations"] = [newComment]
                    }
                    evaluations.append(last!)
                    data["evaluations"] = evaluations
                    patientRef.setData(data, merge: true) { (err) in
                        if let err = err {
                            print("Algo salió aún peor. \(err.localizedDescription)")
                            handler(true)
                            return
                        } else {
                            let evaluationsCount = PatientSelected.shared.patientInfo?.evaluations.count ?? 1
                            PatientSelected.shared.patientInfo?.evaluations[evaluationsCount - 1].observations.append(ObservationSchema(createdAt: Timestamp(), content: comment))
                            handler(false)
                        }
                    }
                }
            }
        }
    }
}
