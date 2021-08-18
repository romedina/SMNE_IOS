//
//  AlgorithmModels.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 29/01/21.
//

import Foundation
import UIKit

struct Algorithm {
    let ID: String
    let title: String
}

struct Option {
    let treatments: [Treatment]
}

struct Treatment {
    let title: String
    let subtitle: String
}

let A = Algorithm(ID: "A", title: "Algortimo de tratamiento en DM2 con diagnóstico reciente, sin complicaciones cardiovasculares o renales con IMC < 30 kg/m2")
let B = Algorithm(ID: "B", title: "Algoritmo de tratamiento en DM2 sin complicaciones cardiovasculares o renales con IMC > 30 kg/m2")
let C = Algorithm(ID: "C", title: "Algoritmo de tratamiento de la DM2 con enfermedad renal crónica (ERC)")
let D = Algorithm(ID: "D", title: "Algortimo en DM2 con insuficiencia cardiaca o IM/ACV")
let E = Algorithm(ID: "E", title: "Algoritmo en DM2 mayores de 65 años")
let F = Algorithm(ID: "F", title: "Algoritmo en DM2 con hipoglucemia")

let algorithmsMatch: [String: [Algorithm]] = [
    "00000": [A],
    "00001": [B],
    "00010": [F],
    "00011": [F],
    "00100": [E],
    "00101": [E],
    "00110": [E, F],
    "00111": [E, F],
    "01000": [D],
    "01001": [D],
    "01010": [D],
    "01011": [D],
    "01100": [D, E],
    "01101": [D, E],
    "01110": [D, E],
    "01111": [D, E],
    "10000": [C],
    "10001": [C],
    "10010": [C],
    "10011": [C],
    "10100": [C, E],
    "10101": [C, E],
    "10110": [C, E],
    "10111": [C, E],
    "11000": [C, D],
    "11001": [C, D],
    "11010": [C, D],
    "11011": [C, D],
    "11100": [C, D],
    "11101": [C, D],
    "11110": [C, D],
    "11111": [C, D],
]

struct TitleCell {
    let title: String
    let subtitle: String
}

struct InfoCell {
    let title: String
}

struct ListCell {
    let title: String
    let options: [String]
}

struct OpenListCell {
    let openTitle: String
    let listTitle: String
    let listOptions: [String]
}

struct OpenCell {
    let title: String
    let placeHolder: String
}

struct BoolCell {
    let title: String
    let sub: String
    let id: String
}

struct AlgorithmCell {
    let id: String
    let title: String
    let backColor: UIColor
    let textColor: UIColor
}

struct SliderCell {
    let title: String
    let max: Int
    let min: Int
    let unit: String
}

struct CommentCell {
    let title: String
}

struct TreatmentCell {
    let options: Option
}

struct RadioCell {
    let title: String
}

struct IMCCell {
    let title: String
}

struct RadioRadioCell {
    let title: String
}

struct OpenOpenCell {
    let title1: String
    let title2: String
    let trailing1: String
    let trailing2: String
    
}

struct MultiRadioCell {
    let title: String
}

struct DeteriorationCell {
    let title: String
}

let stepOne: [Any] = [TitleCell(title: "Crear un nuevo Paciente", subtitle: "Necesitamos un poco de información de tu paciente."), InfoCell(title: ""), OpenOpenCell(title1: "Nombre", title2: "Apellido Paterno", trailing1: "", trailing2: ""), RadioRadioCell(title: "Tipo y género"), OpenCell(title: "Edad", placeHolder: ""), RadioCell(title: "Racial"), OpenCell(title: "Año en que se diagnosticó la diabetes", placeHolder: "")]

let stepTwo: [Any] = [TitleCell(title: "Tratamiento farmacológico DM2", subtitle: "Vamos a crear su historial clínico"), IMCCell(title: ""), BoolCell(title: "¿Tiene enfermedad renal crónica?", sub: "", id: "renal"), BoolCell(title: "¿Sufre de complicaciones cardiovasculares?", sub: "(Infarto al miocardio, accidente cerebrovascular, falla cardiaca o enfermedad arterial periferica)", id: "cardio"), BoolCell(title: "¿Tiene alto riesgo de hipoglucemia?", sub: "", id: "hipo")]

var stepThree: [Any] = [TitleCell(title: "Con base en los datos de tu paciente existen 2 posibles alternativas", subtitle: "")]

var stepFour: [Any] = [TitleCell(title: "Tratamiento farmacológico DM2", subtitle: "Ya casi terminamos."), OpenOpenCell(title1: "Niveles de HbA1c", title2: "Glucosa de ayuno", trailing1: "%", trailing2: "mg"), CommentCell(title: "Observaciones")]

var stepFive: [Any] = [TitleCell(title: "Tratamiento asignado", subtitle: ""), TreatmentCell(options: Option(treatments: [Treatment(title: "", subtitle: "")]))]

struct PatientInfo {
    var id: String
    var name: String
    var lastName: String
    var date: String
    var type: String
    var age: Int
    var gender: String
    var racial: Bool
    var diabetesDate: String
    var IMC: Float
    var renal: Bool?
    var cardio: Bool?
    var hipo: Bool?
    var algorithID: String
    var hba1c: Float
    var glucose: Float
    var filterCup: String?
    var comment: String
    var meta: Float?
}
