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
            return [TreatmentFromDB(name: "", title: "", description: [])]
        }()
        switch algorithm {
        case "A":
            switch currentEv {
            case 1:
                if glucose < 200 || hba1c < 8 {
                    return TreatmentsFromDB().TA_E1_D1
                } else if glucose > 250 || hba1c > 10 {
                    return TreatmentsFromDB().TA_E1_D3
                } else {
                    return TreatmentsFromDB().TA_E1_D2
                }
            case 2:
                if hba1c < 6.5 && !hypoglycemia! { return prevDoseFromDB }
                if hba1c < 8 && hba1c >= 6.5 && prevDose == "TA_E1_D1" {
                    return TreatmentsFromDB().TA_E2_D1
                } else if hba1c >= 8 && hba1c < 10 && (prevDose == "TA_E1_D2" || prevDose == "TA_E1_D3") {
                    return TreatmentsFromDB().TA_E2_D2
                } else if hba1c >= 10 && prevDose == "TA_E1_D3" {
                    return TreatmentsFromDB().TA_E2_D3
                }
            default:
                if hba1c > 5.6 && hba1c < 6.5 && !hypoglycemia! { return prevDoseFromDB }
                if hba1c < 8 && hba1c >= 6.5 && (prevDose == "TA_E2_D1" || prevDose == "TA_E2_D2") {
                    return TreatmentsFromDB().TA_E3_D1
                } else if hba1c >= 8 && prevDose == "TA_E2_D3" {
                    return TreatmentsFromDB().TA_E3_D2
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
                }
            default:
                if hba1c < 6.5 {
                    return TreatmentsFromDB().TB_E3_D1
                } else if hba1c >= 6.5 && hba1c <= 8 {
                    return TreatmentsFromDB().TB_E3_D2
                } else {
                    return TreatmentsFromDB().TB_E3_D3
                }
//                if hba1c < 6.5 && !hypoglycemia! { return prevDoseFromDB }
//                if hba1c < 6.5 && (prevDose == "TB_E2_D1") {
//                    return TreatmentsFromDB().TB_E3_D1
//                    #warning("que pasa aquí, nunca entraría o si? abajo")
//                } else if hba1c > 6.5 && hba1c < 8 && (prevDose == "TB_E2_D2" || prevDose == "TB_E2_D3") {
//                    return TreatmentsFromDB().TB_E3_D1
//                    #warning("que pasa aquí, nunca entraría o si? abajo")
//                } else if hba1c > 6.5 && hba1c < 8 && prevDose == "TB_E2_D3" {
//                    return TreatmentsFromDB().TB_E3_D2
//                } else if hba1c > 10 && prevDose == "TB_E2_D3" {
//                    return TreatmentsFromDB().TB_E3_D3
//                }
            }
        case "D":
            switch currentEv {
            case 1:
                if glucose < 200 || hba1c < 8 {
                    return TreatmentsFromDB().TD_E1_D1
                } else if glucose > 250 || hba1c > 10 {
                    return TreatmentsFromDB().TD_E1_D3
                } else {
                    return TreatmentsFromDB().TD_E1_D2
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
                }
            }
            
        case "E":
            switch currentEv {
            case 1:
                if glucose < 200 || hba1c < 8 {
                    return TreatmentsFromDB().TE_E1_D1
                } else if glucose > 250 || hba1c > 10 {
                    return TreatmentsFromDB().TE_E1_D3
                } else {
                    return TreatmentsFromDB().TE_E1_D2
                }
            default:
                #warning("Aquí va con lo de meta")
                return TreatmentsFromDB().TDefault
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
    
    func getOptionsFromDB(hba1c: Float, glucose: Float, filter: String, currentEv: Int, prevDose: String?) -> [TreatmentFromDB] {
        switch currentEv {
        case 1:
            if glucose < 250 || hba1c < 10 {
                if filter == "59 - 45" || filter == "44 - 30" {
                    return TreatmentsFromDB().TC_E1_D1
                } else if filter == "29 - 15" {
                    return TreatmentsFromDB().TC_E1_D2
                } else if filter == "<15" {
                    return TreatmentsFromDB().TC_E1_D3
                }
                //16/04/2021
            }
            
            if glucose > 250 || hba1c > 10 {
                if filter == "59 - 45" || filter == "44 - 30" {
                    return TreatmentsFromDB().TC_E1_D4
                } else if filter == "29 - 15" {
                    return TreatmentsFromDB().TC_E1_D5
                } else if filter == "<15" {
                    return TreatmentsFromDB().TC_E1_D6
                }
            }
            break
        default:
            if hba1c < 7 && (filter == "44 - 30" || filter == "59 - 45") {
                return TreatmentsFromDB().TC_E2_D1
            } else if (hba1c >= 7 && hba1c <= 8) && (filter == "44 - 30" || filter == "59 - 45") {
                return TreatmentsFromDB().TC_E2_D4
            } else if hba1c < 7.5 && filter == "29 - 15" {
                return TreatmentsFromDB().TC_E2_D2
            } else if hba1c < 7.5 && filter == "<15" {
                return TreatmentsFromDB().TC_E2_D3
            } else if (hba1c >= 7.5 && hba1c <= 8.4) && (filter == "29 - 15" || filter == "<15") {
                return TreatmentsFromDB().TC_E2_D5
            }
            break
        }
        
        return []
    }
    
    func getOptions(algorithm: String, hba1c: Float, glucose: Float) -> [Treatment]{
        switch algorithm {
        case "A":
            if glucose < 200 || hba1c < 8 {
                return treatmentA[0].treatments
            } else if glucose > 250 || hba1c > 10 {
                return treatmentA[2].treatments
            } else {
                return treatmentA[1].treatments
            }
        case "B":
            if glucose < 200 || hba1c < 8 {
                return treatmentB[0].treatments
            } else if glucose > 250 || hba1c > 10 {
                return treatmentB[1].treatments
            } else {
                return treatmentB[2].treatments
            }
        case "D":
            if glucose < 200 || hba1c < 8 {
                return treatmentD[0].treatments
            } else if glucose > 250 || hba1c > 10 {
                return treatmentD[1].treatments
            } else {
                return treatmentD[2].treatments
            }
        case "E":
            if glucose < 200 || hba1c < 8 {
                return treatmentE[0].treatments
            } else if glucose > 250 || hba1c > 10 {
                return treatmentE[1].treatments
            } else {
                return treatmentE[2].treatments
            }
        case "F":
            return treatmentF[0].treatments
        default:
            return [Treatment(title: "Default", subtitle: "Default treatment")]
        }
    }
    
    func getOptions(hba1c: Float, glucose: Float, filter: String) -> [Treatment] {
        if glucose < 250 {
            if filter == "59 - 45" || filter == "44 - 30" {
                return treatmentC[0].treatments
            } else if filter == "29 - 15" {
                return treatmentC[1].treatments
            } else if filter == "<15" {
                return treatmentC[2].treatments
            }
        } else if hba1c > 8 && hba1c < 10 {
            if filter == "59 - 45" || filter == "44 - 30" {
                return treatmentC[0].treatments
            } else if filter == "29 - 15" {
                return treatmentC[1].treatments
            } else if filter == "<15" {
                return treatmentC[2].treatments
            }
        }
        
        if glucose > 250 {
            if filter == "59 - 45" || filter == "44 - 30" {
                return treatmentC[3].treatments
            } else if filter == "29 - 15" {
                return treatmentC[4].treatments
            } else if filter == "<15" {
                return treatmentC[5].treatments
            }
        } else if hba1c > 10 {
            if filter == "59 - 45" || filter == "44 - 30" {
                return treatmentC[3].treatments
            } else if filter == "29 - 15" {
                return treatmentC[4].treatments
            } else if filter == "<15" {
                return treatmentC[5].treatments
            }
        }
        
        return []
    }
    
    func getStep5(options: [TreatmentFromDB]) {
        var newOptions = [Treatment]()
        for op in options {
            for description in op.description {
                if description == op.description.first {
                    let option = Treatment(title: op.title, subtitle: description)
                    newOptions.append(option)
                } else {
                    let option = Treatment(title: "", subtitle: description)
                    newOptions.append(option)
                }
            }
        }
        stepFive[2] = TreatmentCell(options: Option(treatments: newOptions))
        reinitS5()
    }
    
    func reinitS5() {
        step5Cells = {
            var cells: [Any] = []
            for cell in stepFive {
                if let _ = cell as? TitleCell { } else if let _ = cell as? StepperCell { } else {
                    cells.append(cell)
                }
            }
            return cells
        }()
    }
    
}
