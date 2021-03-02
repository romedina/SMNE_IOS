//
//  EvaluationSchema.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 01/03/21.
//

import Foundation

struct EvaluationSchema {
    var age: Int
    var cardiovascularComplications: Bool
    var chronicKidneyDisease: Bool
    var consultationType: ConsultationEnum
    var createdAt: Date
    var creatinineLevels: Double
    var diagnosisYear: Int
    var dose: String
    var estimatedGlomerularFiltrationRate: FiltrationEnum
    var fastingGlucose: Double
    var gender: GenderEnum
    var glycosylatedHemoglobin: Float
    var height: Double
    var hypoglycemia: Bool
    var imc: Double
    var racialAncestry: RacialEnum
    var treatment: TreatmentEnum
    var weight: Double
    var observations: [ObservationSchema]
}
