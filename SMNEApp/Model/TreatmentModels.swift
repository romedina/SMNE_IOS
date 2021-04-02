//
//  TreatmentModels.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 16/02/21.
//

import Foundation

struct Option {
    let treatments: [Treatment]
}

struct Treatment {
    let title: String
    let subtitle: String
}


let treatmentA: [Option] = [
    Option(treatments: [Treatment(title: "Titular la dosis de metformina ≥ 1,500 mg/día", subtitle: "En caso de intolerancia usar de liberación prolongada")]),
    Option(treatments: [Treatment(title: "Metformina a dosis máxima tolerada + iDPP4 o iSGLT2 o SU", subtitle: "")]),
    Option(treatments: [Treatment(title: "Metformina 1,500-2,550 mg/día + SU o Metformina + Insulina basal (0.1-0.2 U/kg)", subtitle: "En caso de pérdida de peso y síntomas de hiperglucemia")])]

let treatmentB: [Option] = [
    Option(treatments: [Treatment(title: "Titular la dosis metformina ≥ 1,500 mg/día", subtitle: "En caso de intolerancia usar de liberación prolongada")]),
    Option(treatments: [Treatment(title: "Metformina a dosis máxima tolerada + iSGLT2 o arGLP-1 o iDDP4 o SU", subtitle: "")]),
    Option(treatments: [Treatment(title: "Metformina + SU + (arGLP-1 o iSGLT2 o iDPP4)", subtitle: ""), Treatment(title: "Metformina + insulina basal (0.1-0.2 U/kg)", subtitle: "En caso de pérdida de peso y síntomas de hiperglicemia")])]

let treatmentC: [Option] = [
    Option(treatments:
            [Treatment(title: "Metformina", subtitle: "ajustar dosis a dosis máxima según tabla 2 y combinar con un:"),
             Treatment(title: "iSGLT2", subtitle: "Si se pretende reducir progresión del deterioro de TFGe y albuminuria (cana, dapa, empa)"),
             Treatment(title: "arGLP1", subtitle: "Si se pretende reducir progresión de albuminuria (lira,sema, dula)")]),
    Option(treatments: [
            Treatment(title: "Insulina basal2", subtitle: "Iniciar con dosis de 0.1 a 0.15 U/kg"),
            Treatment(title: "Insulina basal + arGLP-1 o iDPP41", subtitle: "")]),
    Option(treatments: [
            Treatment(title: "Insulina basal2", subtitle: "Iniciar con dosis de 0.1 U/kg"),
            Treatment(title: "Insulina basal + iDPP41", subtitle: "")]),
    Option(treatments: [
            Treatment(title: "Metformina + insulina basal2 o insulina basal + iSGLT2 o insulina basal + arGLP-1 o insulina basal + iDPP41", subtitle: "")]),
    Option(treatments: [
            Treatment(title: "Insulina basal + arGLP-1 o iDPP41", subtitle: "Iniciar con dosis de 0.1 a 0.15 U/kg")]),
    Option(treatments: [
            Treatment(title: " Insulina basal + iDPP41", subtitle: "Iniciar con dosi de 0.1 U/kg")])
]

let treatmentD: [Option] = [
    Option(treatments: [
            Treatment(title: "Sin tratamiento previo", subtitle: "Metformina. Si no se cuenta con iSGLT2 o arGLP-1\niSGLT2. Si tiene IC o ERC\narGLP-1. Utilizar los que hallan demostradobeneficio CV"),
            Treatment(title: "Con metformina, agregar", subtitle: "iSGLT2. Si tiene IC con FEVI < 45%,TFGe > 30 ml/min \narGLP-1. Se prefiere si tiene IMC > 35 kg/m2 o ACV \niDPP4. Si no se cuenta con iSGLT2 (se contraindica la saxagliptina*) \nSU†. Se prefiere glimepirida, gliclazida")]),
    Option(treatments: [
            Treatment(title: "Sin tratamiento previo", subtitle: "Metformina + iSGLT2 o arGLP-1 o iDPP4"),
            Treatment(title: "Con metformina, agregar", subtitle: "iSGLT2 + iDPP-4. Sin cetosis o pérdida de peso reciente \niSGLT2 + SU†. Con pérdida de peso y síntomas de hiperglucemia \narGLP1. Si tiene IMC > 35 kg/m2 o ACV \nInsulina basal + iSGLT2 o iDPP4 Con una mayor pérdida de peso y síntomas de hiperglucemia (0.1-0.2 U/kg) \nInsulina basal+ arGLP1. Con síntomas de hiperglucemia con IMC > 35 kg/m2")]),
    Option(treatments: [
            Treatment(title: "Sin tratamiento previo", subtitle: "Metformina + insulina basal + iSGLT2 (0.1-0.2 U/kg)"),
            Treatment(title: "Con metformina, agregar", subtitle: "Insulina basal + iSGLT2 o iDPP4 (si no se cuenta con iSGLT2) Con pérdida de peso y síntomas de hiperglucemia (0.1-0.2 U/kg) \nInsulina basal + arGLP-1 Con síntomas de hiperglucemia con IMC > 35 kg/m2 \nSi predomina la IC agregar iSGLT2")])]

let treatmentE: [Option] = [
    Option(treatments: [
            Treatment(title: "Metformina", subtitle: "Titular la dosis ≥ 1,500 mg/día. En caso de dificultad para deglución considerar en solución. En caso de intolerancia usar de liberación prolongada o:"),
            Treatment(title: "iDPP4", subtitle: ""),
            Treatment(title: "iSGLT2", subtitle: "Precaución en > 75 años con diuréticos"),
            Treatment(title: "arGLP-1", subtitle: "Se prefiere de liberación prolongada"),
            Treatment(title: "SU", subtitle: "Se prefiere gliclazida, glipizida y glimepirida"),
            Treatment(title: "Pioglitazona", subtitle: "Evitar en osteoporosis e insuficiencia cardiaca")]),
    Option(treatments: [
        Treatment(title: "Metformina dosis máxima tolerada +", subtitle: ""),
        Treatment(title: "iDPP4", subtitle: ""),
        Treatment(title: "iSGLT2", subtitle: "Se prefiere con IC o ERC"),
        Treatment(title: "arGLP-1.", subtitle: "Se prefiere con IMC > 35 kg/m2 o ECV"),
        Treatment(title: "Insulina basal", subtitle: "Se prefiere en pacientes catabólicos o > 10 años con DM (0.1-0.2 U/kg)"),
        Treatment(title: "SU", subtitle: "")]),
    Option(treatments: [Treatment(title: "Insulina basal (0.1-0.2 U/Kg) + Metformina", subtitle: ""), Treatment(title: "Insulina basal (0.1-0.2 U/Kg) + Metformina + iDPP4  o iSGLT2 o arGLP1", subtitle: "")])]

let treatmentF: [Option] = [
    Option(treatments: [Treatment(title:"Monoterapia", subtitle: "Preferir metformina como primera linea de tratamiento, iDDP4, iSGLT2, arGLP-1")])]
