//
//  ViewModelStep5.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 20/02/21.
//

import Foundation

class ModelViewStep5 {
    func getOptions(algorithm: String, hba1c: Float, glucose: Float) -> [Treatment]{
        switch algorithm {
        case "A":
            if glucose < 200 || hba1c < 8 {
                return treatmentA[0].treatments
            } else if glucose > 250 || hba1c > 10 {
                return treatmentA[1].treatments
            } else {
                return treatmentA[2].treatments
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
            break
        }
        return []
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
    
    func getStep5(options: [Treatment]) {
        for i in options {
            print(i)
        }
        stepFive[2] = TreatmentCell(options: Option(treatments: options))
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
