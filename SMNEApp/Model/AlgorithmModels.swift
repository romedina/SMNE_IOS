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

let A = Algorithm(ID: "A", title: "Algortimo de tratamiento en DM2 con diagnóstico reciente, sin complicaciones cardiovasculares o renales con IMC < 30 kg/m2")
let B = Algorithm(ID: "B", title: "Algoritmo de tratamiento en DM2 sin complicaciones cardiovasculares o renales con IMC > 30 kg/m2")
let C = Algorithm(ID: "C", title: "Algoritmo de tratamiento de la DM2 con enfermedad renal crónica (ERC)")
let D = Algorithm(ID: "D", title: "Algortimo en DM2 con insuficiencia cardiaca o IM/ACV")
let E = Algorithm(ID: "E", title: "Algoritmo en DM2 mayores de 65 años")
let F = Algorithm(ID: "F", title: "Algoritmo en DM2 con hipoglucemia")

let algorithmsMatch: [String: [Algorithm]] = [
    "00000": [A],
    "00001": [B],
    "00010": [D],
    "00011": [D, B],
    "00100": [C],
    "00101": [C, B],
    "00110": [C, D],
    "00111": [C, D],
    "01000": [E],
    "01001": [E],
    "01010": [E, D],
    "01011": [E, D],
    "01100": [E, C],
    "01101": [E, C],
    "01110": [E, C, D],
    "01111": [E, C, D],
    "10000": [F],
    "10001": [F],
    "10010": [F],
    "10011": [F],
    "10100": [F],
    "10101": [F],
    "10110": [F],
    "10111": [F],
    "11000": [F],
    "11001": [F],
    "11010": [F],
    "11011": [F],
    "11100": [F],
    "11101": [F],
    "11110": [F],
    "11111": [F],
]

struct TitleCell {
    let title: String
    let subtitle: String
}

struct StepperCell {
    let page: Int
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
}

struct AlgorithmCell {
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
    let title: String
    let subTitle: String
}

struct RadioCell {
    let title: String
}

struct IMCCell {
    let title: String
}

let stepOne: [Any] = [TitleCell(title: "Crear un nuevo Paciente", subtitle: "Necesitamos un poco de información de tu paciente."), StepperCell(page: 1), InfoCell(title: ""), ListCell(title: "Tipo de consulta", options: ["Privada", "Pública"]), OpenListCell(openTitle: "Edad", listTitle: "Género", listOptions: ["Masculino", "Femenino"]), RadioCell(title: ""), OpenCell(title: "Año en que se diagnosticó la diabetes", placeHolder: "")]

let stepTwo: [Any] = [TitleCell(title: "Tratamiento farmacológico DM2", subtitle: "Vamos a crear su historial clínico"), StepperCell(page: 2), IMCCell(title: ""), BoolCell(title: "¿Tiene enfermedad renal crónica?"), BoolCell(title: "¿Sufre de complicaciones cardiovasculares?"), BoolCell(title: "Tiene hipoglucemia?"), OpenCell(title: "¿Cuál es su IMC?", placeHolder: "Ingresa el índide de Masa Corporal")]

var stepThree: [Any] = [TitleCell(title: "Con base en los datos de tu paciente existen 2 posibles alternativas", subtitle: ""), StepperCell(page: 3)]

var stepFour: [Any] = [TitleCell(title: "", subtitle: "Ya casi terminamos."), StepperCell(page: 4)]

var stepFive: [Any] = [TitleCell(title: "Tratamiento asignado", subtitle: ""), StepperCell(page: 5)]
