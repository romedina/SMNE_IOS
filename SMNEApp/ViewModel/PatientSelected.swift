//
//  PatientSelected.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 19/03/21.
//

import Foundation

class PatientSelected {
    static let shared = PatientSelected()
    var patientInfo: PatientSchema?
    var prevTreatment: String?
    
}
