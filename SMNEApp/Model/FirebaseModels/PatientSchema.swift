//
//  PatientSchema.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 01/03/21.
//

import Foundation
import FirebaseFirestore

struct PatientSchema {
    var pId: String
    var age: Int
    var name: String
    var lastName: String
    var birthDate: Date?
    var consultationType: ConsultationEnum
    var country: String?
    var dose: String
    var createdAt: Timestamp
    var diagnosisYear: Int
    var gender: GenderEnum
    var height: Double
    var racialAncestry: RacialEnum
    var updatedAt: Timestamp
    var weight: Double
    var currentEvaluation: Int
    var currentTreatment: TreatmentEnum
    var evaluations: [EvaluationSchema]
}
