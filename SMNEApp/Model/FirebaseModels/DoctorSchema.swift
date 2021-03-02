//
//  DoctorSchema.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 01/03/21.
//

import Foundation

struct DoctorSchema {
    var name: String
    var lastName: String
    var email: String
    var gender: GenderEnum?
    var professionalLicense: String?
    var specialty: String?
    var medicineSchool: String?
    var country: String?
    var createdAt: Date
    var updatedAt: Date
}
