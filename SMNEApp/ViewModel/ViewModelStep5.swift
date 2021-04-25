//
//  ViewModelStep5.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 20/02/21.
//

import Foundation

class ModelViewStep5 {
    
    func getOptionsFromDB(algorithm: String, hba1c: Float, glucose: Float, currentEv: Int, prevDose: String?, hypoglycemia: Bool?) -> [TreatmentFromDB]{
        let prevDoseFromDB: [TreatmentFromDB] = {
            if prevDose != nil {
                for treatment in TreatmentsFromDB().treatmentList {
                    if treatment.first!.name == prevDose! {
                        return treatment
                    }
                }
            }
            return [TreatmentFromDB(name: "")]
        }()
        switch algorithm {
        case "A":
            switch currentEv {
            case 1:
                if glucose < 200 || hba1c < 8 {
                    return TreatmentsFromDB().TA_E1_D1
                } else if glucose < 250 || hba1c < 10 {
                    return TreatmentsFromDB().TA_E1_D2
                } else if glucose >= 250 || hba1c >= 10 {
                    return TreatmentsFromDB().TA_E1_D3
                } else {
                    return TreatmentsFromDB().TDefault
                }
                
            case 2:
                if hba1c < 6.5 && !hypoglycemia! { return prevDoseFromDB }
                if hba1c < 8 && hba1c >= 6.5 && prevDose == "TA_E1_D1" {
                    return TreatmentsFromDB().TA_E2_D1
                } else if hba1c >= 8 && hba1c < 10 && (prevDose == "TA_E1_D2" || prevDose == "TA_E1_D3") {
                    return TreatmentsFromDB().TA_E2_D2
                } else if hba1c >= 10 && prevDose == "TA_E1_D3" {
                    return TreatmentsFromDB().TA_E2_D3
                } else {
                    return TreatmentsFromDB().TDefault
                }
            default:
                if hba1c > 5.6 && hba1c < 6.5 && !hypoglycemia! { return prevDoseFromDB }
                if hba1c < 8 && hba1c >= 6.5 && (prevDose == "TA_E2_D1" || prevDose == "TA_E2_D2") {
                    return TreatmentsFromDB().TA_E3_D1
                } else if hba1c >= 8 && prevDose == "TA_E2_D3" {
                    return TreatmentsFromDB().TA_E3_D2
                } else {
                    return TreatmentsFromDB().TDefault
                }
            }
        case "B":
            switch currentEv {
            case 1:
                if glucose < 200 || hba1c < 8 {
                    return TreatmentsFromDB().TB_E1_D1
                } else if glucose > 250 || hba1c > 10 {
                    return TreatmentsFromDB().TB_E1_D3
                } else {
                    return TreatmentsFromDB().TB_E1_D2
                }
            case 2:
                if hba1c < 6.5 && !hypoglycemia! { return prevDoseFromDB }
                if hba1c < 8 && hba1c > 6.5  && prevDose == "TB_E1_D1" {
                    return TreatmentsFromDB().TB_E2_D1
                } else if hba1c >= 8 && hba1c < 10 && prevDose == "TB_E1_D2"{
                    return TreatmentsFromDB().TB_E2_D2
                } else if hba1c >= 10 && prevDose == "TB_E1_D3" {
                    return TreatmentsFromDB().TB_E2_D3
                } else {
                    return TreatmentsFromDB().TDefault
                }
            default:
                if hba1c < 6.5 {
                    return TreatmentsFromDB().TB_E3_D1
                } else if hba1c >= 6.5 && hba1c <= 8 {
                    return TreatmentsFromDB().TB_E3_D2
                } else {
                    return TreatmentsFromDB().TB_E3_D3
                }
            }
        case "D":
            switch currentEv {
            case 1:
                if glucose < 200 || hba1c < 8 {
                    return TreatmentsFromDB().TD_E1_D1
                } else if glucose < 250 || hba1c < 10 {
                    return TreatmentsFromDB().TD_E1_D2
                } else if glucose >= 250 || hba1c >= 10 {
                    return TreatmentsFromDB().TD_E1_D3
                } else {
                    return TreatmentsFromDB().TDefault
                }
            default:
                if hba1c > 7 && hba1c < 8  && prevDose == "TD_E1_D1" {
                    return TreatmentsFromDB().TD_E2_D1
                } else if hba1c > 7 && hba1c < 8  && prevDose == "TD_E1_D2" {
                    return TreatmentsFromDB().TD_E2_D2
                } else if hba1c >= 8 && hba1c <= 10  && prevDose == "TD_E1_D2" {
                    return TreatmentsFromDB().TD_E1_D3
                } else if hba1c > 7 && hba1c < 8  && prevDose == "TD_E1_D3" {
                    return TreatmentsFromDB().TD_E2_D4
                } else if hba1c >= 8 && hba1c <= 10 && prevDose == "TD_E1_D3" {
                    return TreatmentsFromDB().TD_E2_D5
                } else {
                    return TreatmentsFromDB().TDefault
                }
            }
        case "F":
            switch currentEv {
            case 1:
                return TreatmentsFromDB().TF_E1_D1
            case 2:
                return TreatmentsFromDB().TF_E1_D2
            default:
                return TreatmentsFromDB().TF_E1_D3
            }
        default:
            break
        }
        return []
    }
    
    //Flow for algorithm C
    func getOptionsFromDB(hba1c: Float, glucose: Float, filter: String, currentEv: Int, prevDose: String?) -> [TreatmentFromDB] {
        switch currentEv {
        case 1:
            if glucose < 250 || hba1c < 10 && hba1c > 8{
                if filter == "59 - 45" || filter == "44 - 30" {
                    return TreatmentsFromDB().TC_E1_D1
                } else if filter == "29 - 15" {
                    return TreatmentsFromDB().TC_E1_D2
                } else if filter == "<15" {
                    return TreatmentsFromDB().TC_E1_D3
                }
            }
            
            if glucose >= 250 || hba1c >= 10 {
                if filter == "59 - 45" || filter == "44 - 30" {
                    return TreatmentsFromDB().TC_E1_D4
                } else if filter == "29 - 15" {
                    return TreatmentsFromDB().TC_E1_D5
                } else if filter == "<15" {
                    return TreatmentsFromDB().TC_E1_D6
                }
            }
            return TreatmentsFromDB().TDefault
        default:
            if prevDose == "TC_D1_E1" && filter == "44 - 30" && hba1c >= 7 {
                return TreatmentsFromDB().TC_E2_D1
            } else if prevDose == "TC_D1_E2" && filter == "59 - 45" && hba1c >= 7 {
                return TreatmentsFromDB().TC_E2_D2
            } else if prevDose == "TC_D1_E3" && filter == "29 - 15" && hba1c >= 7.5 {
                return TreatmentsFromDB().TC_E2_D3
            } else if prevDose == "TC_D1_E4" && filter == "<15" && hba1c >= 7.5 {
                return TreatmentsFromDB().TC_E2_D4
            } else if prevDose == "TC_D1_E5" && filter == "59 - 45" && hba1c >= 8 {
                return TreatmentsFromDB().TC_E2_D5
            } else if prevDose == "TC_D1_E6" && filter == "44 - 30" && hba1c >= 8 {
                return TreatmentsFromDB().TC_E2_D6
            } else if prevDose == "TC_D1_E7" && filter == "29 - 15" && hba1c >= 8.4 {
                return TreatmentsFromDB().TC_E2_D7
            } else if prevDose == "TC_D1_E8" && filter == "<15" && hba1c >= 8.4 {
                return TreatmentsFromDB().TC_E2_D8
            } else {
                return TreatmentsFromDB().TDefault
            }
        }
    }
    
    //Flow for algorithm E
    func getOptionsFromDB(hba1c: Float, glucose: Float, filter: String, currentEv: Int, prevDose: String?, meta: Float?) -> [TreatmentFromDB] {
        switch currentEv {
        case 1:
            if glucose < 200 || hba1c < 8 {
                return TreatmentsFromDB().TE_E1_D1
            } else if glucose < 250 || hba1c < 10 {
                return TreatmentsFromDB().TE_E1_D2
            } else if glucose >= 250 || hba1c >= 10 {
                return TreatmentsFromDB().TE_E1_D3
            } else {
                return TreatmentsFromDB().TDefault
            }
            
        default:
            guard let meta = meta else { return [] }
            if prevDose == "TE_E1_D1" && hba1c > meta && hba1c < 8 {
                return TreatmentsFromDB().TE_E2_D1
            } else if prevDose == "TE_E1_D2" && hba1c > meta && hba1c < 8 {
                return TreatmentsFromDB().TE_E2_D2
            } else if prevDose == "TE_E1_D2" && hba1c < 10 && hba1c > 8 {
                return TreatmentsFromDB().TE_E2_D3
            } else if prevDose == "TE_E1_D3" && hba1c > meta && hba1c < 8 {
                return TreatmentsFromDB().TE_E2_D4
            } else if prevDose == "TE_E1_D3" && hba1c > 8 && hba1c < 10 {
                return TreatmentsFromDB().TE_E2_D5
            } else if prevDose == "TE_E1_D3" && hba1c > 10 {
                return TreatmentsFromDB().TE_E2_D6
            } else {
                return TreatmentsFromDB().TDefault
            }
        }
    }
    
    func getStep5(options: [TreatmentFromDB]) {
        stepFive.append(options.first!.name)
        reinitS5()
    }
    
    func reinitS5() {
        step5Cells = {
            var cells: [Any] = []
            for cell in stepFive {
                if let _ = cell as? TitleCell { } else {
                    cells.append(cell)
                }
            }
            return cells
        }()
    }
    
}
