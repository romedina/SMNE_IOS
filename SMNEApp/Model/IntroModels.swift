//
//  IntroModels.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 10/02/21.
//

import Foundation

struct IntroInfo {
    let title: String
    let info: String
}

let introInfoArray: [IntroInfo] = [
    IntroInfo(title: "¿Para qué es esta herramienta?", info: "Esta herramienta fue creada con la finalidad de guiarte en el tratamiento adecuado y a tener un mejor manejo del paciente con DM2."),
    IntroInfo(title: "¿Cómo lograr el tratamiento ideal?", info: "Ingresas los síntomas y padecimientos de tu paciente para obtener un escenario clínico y llegar a un resultado específico."),
    IntroInfo(title: "¿La información ingresada se mantienen seguras?", info: "Toda la información ingresada, tuya com ola de tu paciente se mantienen seguras.")
]
