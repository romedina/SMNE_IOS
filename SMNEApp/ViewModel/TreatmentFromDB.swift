//
//  TreatmentFromDB.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/03/21.
//

import Foundation

struct TreatmentFromDB {
    let name: String
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

    let TA_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E1_D1")]
    let TA_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E1_D2")]
    let TA_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E1_D3")]
    let TA_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E2_D1")]
    let TA_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E2_D2")]
    let TA_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E2_D3")]
    let TA_E3_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E3_D1")]
    let TA_E3_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TA_E3_D2")]
    let TB_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E1_D1")]
    let TB_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E1_D2")]
    let TB_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E1_D3")]
    let TB_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E2_D1")]
    let TB_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E2_D2")]
    let TB_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E2_D3")]
    let TB_E3_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E3_D1")]
    let TB_E3_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E3_D2")]
    let TB_E3_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TB_E3_D3")]
    let TC_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D1")]
    let TC_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D2")]
    let TC_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D3")]
    let TC_E1_D4: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D4")]
    let TC_E1_D5: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D5")]
    let TC_E1_D6: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E1_D6")]
    let TC_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D1")]
    let TC_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D2")]
    let TC_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D3")]
    let TC_E2_D4: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D4")]
    let TC_E2_D5: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D5")]
    let TC_E2_D6: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D6")]
    let TC_E2_D7: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D7")]
    let TC_E2_D8: [TreatmentFromDB] = [TreatmentFromDB(name: "TC_E2_D8")]
    let TD_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E1_D1")]
    let TD_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E1_D2")]
    let TD_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E1_D3")]
    let TD_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D1")]
    let TD_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D2")]
    let TD_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D3")]
    let TD_E2_D4: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D4")]
    let TD_E2_D5: [TreatmentFromDB] = [TreatmentFromDB(name: "TD_E2_D5")]
    let TE_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E1_D1")]
    let TE_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E1_D2")]
    let TE_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E1_D3")]
    let TE_E2_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D1")]
    let TE_E2_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D2")]
    let TE_E2_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D3")]
    let TE_E2_D4: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D4")]
    let TE_E2_D5: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D5")]
    let TE_E2_D6: [TreatmentFromDB] = [TreatmentFromDB(name: "TE_E2_D6")]
    let TF_E1_D1: [TreatmentFromDB] = [TreatmentFromDB(name: "TF_E1_D1")]
    let TF_E1_D2: [TreatmentFromDB] = [TreatmentFromDB(name: "TF_E1_D2")]
    let TF_E1_D3: [TreatmentFromDB] = [TreatmentFromDB(name: "TF_E1_D3")]
    let TDefault: [TreatmentFromDB] = [TreatmentFromDB(name: "Default")]
}
