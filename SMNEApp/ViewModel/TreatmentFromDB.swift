//
//  TreatmentFromDB.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/03/21.
//

import Foundation

struct TreatmentFromDB {
    let name: String
    let title: String
    let description: [String]
}

class TreatmentsFromDB {
    
    var treatmentList = [[TreatmentFromDB]]()
    
    init() {
        initList()
    }
    
    private func initList() {
        //MARK:-Algorithm A
        treatmentList.append(TA_E1_D1)
        treatmentList.append(TA_E1_D2)
        treatmentList.append(TA_E1_D3)
        treatmentList.append(TA_E2_D1)
        treatmentList.append(TA_E2_D2)
        treatmentList.append(TA_E2_D3)
        treatmentList.append(TA_E3_D1)
        treatmentList.append(TA_E3_D2)
        //MARK:-Algorithm B
        treatmentList.append(TB_E1_D1)
        treatmentList.append(TB_E1_D2)
        treatmentList.append(TB_E1_D3)
        treatmentList.append(TB_E2_D1)
        treatmentList.append(TB_E2_D2)
        treatmentList.append(TB_E2_D3)
        treatmentList.append(TB_E3_D1)
        treatmentList.append(TB_E3_D2)
        treatmentList.append(TB_E3_D3)
        //MARK:-Algorithm C
        treatmentList.append(TC_E1_D1)
        treatmentList.append(TC_E1_D2)
        treatmentList.append(TC_E1_D3)
        treatmentList.append(TC_E1_D4)
        treatmentList.append(TC_E1_D5)
        treatmentList.append(TC_E1_D6)
        treatmentList.append(TC_E2_D1)
        treatmentList.append(TC_E2_D2)
        treatmentList.append(TC_E2_D3)
        treatmentList.append(TC_E2_D4)
        treatmentList.append(TC_E2_D5)
        //MARK:-Algorithm D
        treatmentList.append(TD_E1_D1)
        treatmentList.append(TD_E1_D2)
        treatmentList.append(TD_E1_D3)
        treatmentList.append(TD_E2_D1)
        treatmentList.append(TD_E2_D2)
        treatmentList.append(TD_E2_D3)
        treatmentList.append(TD_E2_D4)
        treatmentList.append(TD_E2_D5)
        //MARK:-Algorithm E
        treatmentList.append(TE_E1_D1)
        treatmentList.append(TE_E1_D2)
        treatmentList.append(TE_E1_D3)
        treatmentList.append(TE_E2_D1)
        treatmentList.append(TE_E2_D2)
        treatmentList.append(TE_E2_D3)
        treatmentList.append(TE_E2_D4)
        treatmentList.append(TE_E2_D5)
        treatmentList.append(TE_E2_D6)
        //MARK:-Algorithm F
        treatmentList.append(TF_E1_D1)
        treatmentList.append(TF_E1_D2)
        treatmentList.append(TF_E1_D3)
    }

    let TA_E1_D1: [TreatmentFromDB] = [
        TreatmentFromDB(name: "TA_E1_D1",title: "Titular la dosis de metformina ≥ 1,500 mg/día", description : ["En caso de intolerancia usar de liberación prolongada"]
        )
    ]
    
    
    let TA_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(
        name:"TA_E1_D2", title: "Metformina a dosis máxima tolerada + iDPP4 o iSGLT2 o SU", description: [""]
    )
    ]
    let TA_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E1_D3",
                                                       title: "Metformina 1,500-2,550 mg/día + SU o Metformina + Insulina basal (0.1-0.2 U/kg)",
                                                       description: [
                                                        "En caso de pérdida de peso y síntomas de hiperglucemia",
                                                       ]
    )
    ]
    let TA_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E2_D1",
                                                       title: "Titular metformina 2,550 mg/día o dosis máxima tolerada",
                                                       description: [
                                                        "Agregar",
                                                        "iDPP4", "iSGLT2", "SU", "Pioglitazona"
                                                       ]
    )
    ]
    let TA_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E2_D2",
                                                       title: "Metformina + iDPP4 o iSGLT2 o SU",
                                                       description: [
                                                        "Agregar",
                                                        "SU", "iSGLT2", "iDPP4", "Insulina basal (0.1-0.2 U/kg)", "arGLP-1 (retirar el iDPP4)", "Pioglitazona"
                                                       ]
    )
    ]
    let TA_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E2_D3",
                                                       title: "Metformina + SU",
                                                       description: [
                                                        "Agregar",
                                                        "Insulina basal", "Insulina basal/plus o basal/bolo o o premezcla o (retirar SU)", " Insulina basal/arGLP-1 combinación fija", "arGLP-1"
                                                       ]
    ),
    ( TreatmentFromDB(name: "",
                      title: "Metformina + insulina basal",
                      description: [
                        "Agregar Insulina prandial o basal/bolo", "Cambiar a insulina premezcla", "Insulina basal/arGLP-1", "Agregar arGLP-1"
                      ]
    )
    )
    ]
    let TA_E3_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E3_D1",
                                                       title: "",
                                                       description: [
                                                        "Agregar Insulina basal"
                                                       ]
    )
    ]
    let TA_E3_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E3_D2",
                                                       title: "Metformina + insulina basal/bolo",
                                                       description: [
                                                        "Agregar iSGLT2", " Agregar arGLP-1"
                                                       ]
    )
    ]
    let TB_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E1_D1",
                                                       title: "Titular la dosis metformina ≥ 1,500 mg/día",
                                                       description: [
                                                        "En caso de intolerancia usar de liberación prolongada"
                                                       ]
    )
    ]
    let TB_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E1_D2",
                                                       title: "Metformina a dosis máxima tolerada + iSGLT2 arGLP-1 iDDP4 SU",description: []
    )
    ]
    let TB_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E1_D3",
                                                       title: "(Metformina + SU o iSGLT2 o iDPP4) o Metformina + insulina basal (0.1-0.2 U/kg)",
                                                       description: [
                                                        "En caso de pérdida de peso y síntomas de hiperglucemia",
                                                       ]
    )
    ]
    let TB_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E2_D1",
                                                       title: "Titular metformina 2,550 mg/día o dosis máxima tolerada",
                                                       description: [
                                                        "Agregar",
                                                        "iSGLT2", "iSGLT2", "arGLP-1", "SU"
                                                       ]
    )
    ]
    let TB_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E2_D2",
                                                       title: "Metformina + iSGLT2 o arGLP-1 o iDPP4 o SU",
                                                       description: [
                                                        "Agregar",
                                                        "iDPP4", "iDPP4", "arGLP-1 (retirar el iDPP4)", "SU", "Insulina basal (0.1-0.2 U/kg)"
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Metformina + insulina basal",
                     description: [
                        "Agregar",
                        "iSGLT2", "arGLP-1", "iDPP4", "SU"
                     ]
    )
    )
    ]
    let TB_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E2_D3",
                                                       title: "Metformina + SU + (arGLP-1 o iSGLT2 o iDPP4)",
                                                       description: [
                                                        "Agregar",
                                                        "Insulina basal", "iSGLT2", "arGLP-1 (retirar iDPP4)", " Insulina basal/plus o basal/bolo o premezcla (retirar SU)"
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Metformina + insulina basal",
                     description: [
                        "Agregar",
                        "arGLP-1", "Insulina basal/arGLP-1", "Insulina prandial o basal/bolo", "cambiar a premezcla"
                     ]
    ))
    ]
    let TB_E3_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E3_D1",
                                                       title: "Metformina + 2 antidiabéticos",
                                                       description: [
                                                        "Agregar",
                                                        "Insulina basal", "arGLP-1", "Insulina basal/plus o basal/bolo o premezcla o (retirar SU)"
                                                       ]
    )
    ]
    let TB_E3_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E3_D2",
                                                       title: "Metformina + insulina basal",
                                                       description: [
                                                        "Agregar",
                                                        "arGLP-1", "Insulina basal/arGLP-1", "Insulina prandial o basal/bolo", "Cambiar a premezcla"
                                                       ]
    )
    ]
    let TB_E3_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E3_D3",
                                                       title: "",
                                                       description: [
                                                        "Agregar",
                                                        "Insulina prandial o basal/bolo"
                                                       ]
    )
    ]
    let TC_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D1",
                                                       title: "Metformina",
                                                       description: [
                                                        "ajustar dosis a dosis máxima según tabla 2 y combinar con un"
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "iSGLT2",
                     description: [
                        "Si se pretende reducir progresión del deterioro de TFGe y albuminuria (cana, dapa, empa)"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "arGLP1",
                     description: [
                        "Si se pretende reducir progresión de albuminuria (lira, sema, dula)"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "iDPP41",
                     description: [
                        "Ajustar dosis según tabla 2"
                     ]
    ))
    ]
    let TC_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D2",
                                                       title: "Insulina basal2",
                                                       description: [
                                                        "Iniciar con dosis de 0.1 a 0.15 U/kg"
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + arGLP-1 o iDPP41", description: []
    ))
    ]
    let TC_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D3",
                                                       title: "Insulina basal2",
                                                       description: [
                                                        "Iniciar con dosis de 0.1 U/kg"
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + iDPP41", description: []
    ))
    ]
    let TC_E1_D4: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D4",
                                                       title: "Metformina + (insulina basal2 o insulina basal + iSGLT2 o insulina basal + arGLP-1 oinsulina basal + iDPP41)", description: []
    )
    ]
    let TC_E1_D5: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D5",
                                                       title: "Insulina basal + arGLP-1 o iDPP41",
                                                       description: [
                                                        "Iniciar con dosis de 0.1 a 0.15 U/kg"
                                                       ]
    )
    ]
    let TC_E1_D6: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D6",
                                                       title: "Insulina basal + iDPP41",
                                                       description: [
                                                        "Iniciar con dosi de 0.1 U/kg"
                                                       ]
    )
    ]
    let TC_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D1",
                                                       title: "Metformina + iSGLT2 o arGLP-1 o iDPP4",
                                                       description: [
                                                        "Agregar",
                                                        "Insulina basal. Iniciar con dosis de 0.1 a 0.15 U/kg", "iDPP4", "arGLP-1"
                                                       ]
    )
    ]
    let TC_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D2",
                                                       title: "Insulina basal",
                                                       description: [
                                                        "Intensificar dosis basal",
                                                        "agregar",
                                                        "arGLP-1", "iDPP4",
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + arGLP-1 o iDPP4",
                     description: [
                        "Intensificar dosis basal",
                        "Agregar",
                        "Insulina prandial"
                     ]
    ))
    ]
    let TC_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D3",
                                                       title: "Insulina basal",
                                                       description: [
                                                        "Intensificar dosis basal",
                                                        "Agregar",
                                                        "iDPP4",
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + iDPP4",
                     description: [
                        "Intensificar dosis basal"
                     ]
    ))
    ]
    let TC_E2_D4: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D4",
                                                       title: "Metformina + insulina basal",
                                                       description: [
                                                        "Intensificar dosis basal",
                                                        "Agregar",
                                                        "iSGLT2", "arGLP-1", "iDPP4"
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + iSGLT2 o arGLP-1 o iDPP4",
                     description: [
                        "Intensificar dosis basal",
                        "Agregar",
                        "Insulina prandial o basal/bolo",
                     ]
    ))
    ]
    let TC_E2_D5: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D5",title: "",
                                                       description: [
                                                        "Intensificar dosis basal2",
                                                        "Agregar",
                                                        "Insulina prandial o basal/bolo",
                                                       ]
    )
    ]
    let TD_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E1_D1",title: "",
                                                       description: [
                                                        "Sin tratamiento previo",
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Metformina",
                     description: [
                        "Si no se cuenta con iSGLT2 o arGLP-1"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "iSGLT2",
                     description: [
                        " Si tiene IC o ERC"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "arGLP-1",
                     description: [
                        "Utilizar los que hallan demostrado beneficio CV"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "Con metformina, agregar",description: []
    )),
    (TreatmentFromDB(name: "",
                     title: "iSGLT2",
                     description: [
                        "Si tiene IC con FEVI < 45%, TFGe > 30 ml/min"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "arGLP-1",
                     description: ["Se prefiere si tiene IMC > 35 kg/m2o ACV"]
    )),
    (TreatmentFromDB(name: "",
                     title: "iDPP4",
                     description: ["Si no se cuenta con iSGLT2 (se contraindica la saxagliptina*)"]
    )),
    (TreatmentFromDB(name: "",
                     title: " SU†",
                     description: ["Se prefiere glimepirida, gliclazida"]
    )),
    ]
    let TD_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E1_D2",
                                                       title: "Sin tratamiento previo",description: []
    ),
    (TreatmentFromDB(name: "",
                     title: "Metformina + iSGLT2 o arGLP-1 o iDPP4",description: []
    )),
    (TreatmentFromDB(name: "",
                     title: "Con metformina, agregar",description: []
    )),
    (TreatmentFromDB(name: "",
                     title: "iSGLT2 + iDPP-4",
                     description: [
                        "Sin cetosis o pérdida de peso reciente"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "iSGLT2 + SU†",
                     description: [
                        "Con pérdida de peso y síntomas de hiperglucemia"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "arGLP1",
                     description: [
                        "Si tiene IMC > 35 kg/m2 o ACV"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + iSGLT2 o iDPP4",
                     description: [
                        "Con una mayor pérdida de peso y síntomas de hiperglucemia (0.1-0.2 U/kg)"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal+ arGLP1",
                     description: [
                        "Con síntomas de hiperglucemia con IMC > 35 kg/m2"
                     ]
    )),
    ]
    let TD_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E1_D3",title: "",
                                                       description: ["Sin tratamiento previo"]
    ),
    (TreatmentFromDB(name: "",
                     title: "Metformina + insulina basal + iSGLT2",
                     description: ["(0.1-0.2 U/kg) "]
    )),
    (TreatmentFromDB(name: "",
                     title: "Con metformina, agregar",description: []
    )),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + iSGLT2 o iDPP4",
                     description: [
                        "(si no se cuenta con iSGLT2) Con pérdida de peso y síntomas de hiperglucemia (0.1-0.2 U/kg) "
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + arGLP-1",
                     description: [
                        "Con síntomas de hiperglucemia con IMC > 35 kg/m2 Si predomina la IC agregar iSGLT2"
                     ]
    )),
    ]
    
    let TD_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D1",
                                                       title: "En monoterapia",
                                                       description: [
                                                        "Agregar",
                                                        "iSGLT2", "arGLP-1", "Metformina", "iDPP4", "SU"
                                                       ]
    )
    ]
    let TD_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D2",
                                                       title: "Metformina + iSGLT2 o arGLP-1 o iDPP4",
                                                       description: [
                                                        "Agregar",
                                                        "arGLP-1 (retirar el iDPP4)", "Insulina basal", "SU"
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "Metformina + 2 antidiabéticos",
                     description: [
                        "Agregar",
                        "Insulina basal", "arGLP-1 (retirar el iDPP4)"
                     ]
    )),
    (TreatmentFromDB(name: "",
                     title: "Metformina + insulina basal + iSGLT2 o arGLP-1 o iDPP4",
                     description: ["Intensificar insulina basa", "Agregar insulina prandial"]
    ))
    ]
    let TD_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D3",
                                                       title: "Metformina + 2 antidiabéticos",
                                                       description: ["Agregar", "Insulina basal", "arGLP-1 (retirar el iDPP4)"]
    ),
    (TreatmentFromDB(name: "",
                     title: "Metformina + insulina basal + iSGLT2 o arGLP-1 o iDPP4",
                     description: ["Intensificar insulina basal", "Agregar insulina prandial o arGLP-1 (retirar el iDPP4)"]
    )),
    ]
    let TD_E2_D4: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D4",
                                                       title: "Metformina + insulina basal + iSGLT2 o arGLPL-1 o iDPP4",
                                                       description: [
                                                        "Intensificar insulina basal",
                                                        "Agregar",
                                                        "arGLP-1 (retirar el iDPP4)", "Insulina prandial"
                                                       ]
    )
    ]
    let TD_E2_D5: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D5",
                                                       title: "Metformina + insulina basal + iSGLT2 o arGLP-1 o iDPP4",
                                                       description: ["Intensificar la insulina basal", "Agregar", "Insulina prandial o basal/bolo", "Insulina premezcla", "arGLP-1 (retirar el iDPP4)", "iSGLT2"]
    )
    ]
    let TE_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E1_D1",
                                                       title: "Metformina",
                                                       description: [
                                                        "Titular la dosis ≥ 1,500 mg/día. En caso de dificultad para deglución considerar en solución. En caso de intolerancia usar de liberación prolongada o:"
                                                       ]
    ),
    (TreatmentFromDB(name: "",
                     title: "iDPP4",description: []
    )),
    (TreatmentFromDB(name: "",
                     title: "iSGLT2",
                     description: ["Precaución en > 75 años con diuréticos"]
    )),
    (TreatmentFromDB(name: "",
                     title: "arGLP-1",
                     description: ["Se prefiere de liberación prolongada"]
    )),
    (TreatmentFromDB(name: "",
                     title: "SU",
                     description: ["Se prefiere gliclazida, glipizida y glimepirida"]
    )),
    (TreatmentFromDB(name: "",
                     title: "Pioglitazona",
                     description: ["Evitar en osteoporosis e insuficiencia cardiaca."]
    ))
    ]
    let TE_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E1_D2",
                                                       title: "Metformina dosis máxima tolerada +",description: []
    ),
    (TreatmentFromDB(name: "",
                     title: "iDPP4",description: []
    )),
    (TreatmentFromDB(name: "",
                     title: "iSGLT2",
                     description: ["Se prefiere con IC o ERC"]
    )),
    (TreatmentFromDB(name: "",
                     title: "arGLP-1",
                     description: ["Se prefiere con IMC > 35 kg/m2 o ECV"]
    )),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal",
                     description: ["Se prefiere en pacientes catabólicos o > 10 años con DM (0.1-0.2 U/kg)"]
    )),
    (TreatmentFromDB(name: "",
                     title: "SU",description: []
    ))
    ]
    let TE_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E1_D3",
                                                       title: "Insulina basal + Metformina",
                                                       description: ["(0.1-0.2 U/Kg)"]
    ),
    (TreatmentFromDB(name: "",
                     title: "o Insulina basal + Metformina + iDPP4 o iSGLT2 o arGLP1",
                     description: ["(0.1-0.2 U/Kg)"]
    ))
    ]
    let TE_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D1",
                                                       title: "Con metformina",
                                                       description: ["Agregar", "iDPP4", "iSGLT2", "SU", "arGLP-1", "Insulina basal", "En intolerancia a metformina", "iDPP4 + iSGLT2 o SU o insulina basal", "iSGLT2 + iDPP4 o SU o insulina basal",
                                                                     "arGLP-1 + iSGLT2", "SU + iDPP4 o iSGLT2 o arGLP-1", " Pioglitazona + iSGLT2"]
    )
    ]
    let TE_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D2",
                                                       title: "Con metformina",
                                                       description: ["Agregar", "iSGLT2", "arGLP-1 (retirar iDPP4)", "SU dosis bajas", "Insulina basal (0.1 U/kg)"]
    )
    ]
    let TE_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D3",
                                                       title: "Metformina + iDPP4 o iSGLT2 o arGLP-1 o SU",
                                                       description: ["Agregar", "insulina basal (si tiene SU retirarla)", "iSGLT2", "arGLP-1 (retirar iDPP4)"]
    ),
    (TreatmentFromDB(name: "",
                     title: "Metformina + insulina basal",
                     description: ["Intensificar", "Titular dosis de insulina basal", "• Insulina basal/arGLP-1", "Agregar", "arGLP-1", "Insulina prandial/bolo"]
    )),
    ]
    let TE_E2_D4: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D4",
                                                       title: "Insulina basal + metformina",
                                                       description: ["Agregar", "iDPP4", "iSGLT2", "SU", "arGLP-1"]
    ),
    (TreatmentFromDB(name: "",
                     title: "Insulina basal + metformina + iDPP4 o iSGLT2  o arGLP-1",
                     description: ["Intensificar", "titular dosis de insulina basal", "Insulina basal/arGLP-1", "Agregar", "arGLP-1 (retirar iDPP4)", "Insulina prandial"]
    )),
    ]
    let TE_E2_D5: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D5",
                                                       title: "Insulina basal + metformina",
                                                       description: ["Intensificar", "titular dosis de insulina basal", "Insulina basal/arGLP-1", "Agregar", "insulina prandial/bolo"]
    )
    ]
    let TE_E2_D6: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D6",
                                                       title: "Insulina basal + metformina + iDPP4 o iSGLT2 o arGLP-1",description: []
    )
    ]
    let TF_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TF_E1_D1",
                                                       title: "Monoterapia",
                                                       description: ["Preferir metformina como primera línea de tratamiento, iDDP4, iSGLT2, arGLP-1"]
    )
    ]
    let TF_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TF_E1_D2",
                                                       title: "Terapia dual",
                                                       description: ["Agregar iDPP4, iSGLT2, pioglitazona o arGLP-1"]
    )
    ]
    let TF_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TF_E1_D3",
                                                       title: "Terapia triple",
                                                       description: ["Agregar iDPP4,", "iSGLT2, pioglitazona, arGLP-1 o SU", "(evitar glibenclamida/clorpropamida)", "Agregar: insulina basal (de preferencia análogos de acción prolongada con menor riesgo de hipoglucemia)"]
    )
    ]
    let TDefault: [TreatmentFromDB] = [TreatmentFromDB(name: "Default", title: "Aún no sabemos que va aquí", description: ["Falta que pases que se hace en el default jeje saludos"])]
    
}
