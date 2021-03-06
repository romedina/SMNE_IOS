//
//  SchemaEnum.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 01/03/21.
//

import Foundation

enum RacialEnum: String {
    case No = "afroAmerican"
    case Afroamericano = "notAfroAmerican"
}

enum TreatmentEnum: String {
    case A = "A"
    case B = "B"
    case C = "C"
    case D = "D"
    case E = "E"
    case F = "F"
}

enum FiltrationEnum: String {
    case uno = "<15"
    case dos = "15-29"
    case tres = "30-44"
    case cuatro = "45-59"
}

enum ConsultationEnum: String {
    case publica = "public"
    case privada = "private"
}

enum GenderEnum: String {
    case mas = "male"
    case fem = "female"
}
