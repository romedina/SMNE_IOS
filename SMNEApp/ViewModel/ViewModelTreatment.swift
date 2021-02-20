//
//  ViewModelTreatment.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 18/02/21.
//

import Foundation

class ViewModelTreatment {
    var algorithm: String = ""
    var options: [Option]?
    var treatment: [Treatment]?
    
    func getTreatmentOptions(algorithm: String){
        self.algorithm = algorithm
        
        switch algorithm {
        case "A":
            options = treatmentA
            break
        case "B":
            options = treatmentB
            break
        case "C":
            options = treatmentC
            break
        case "D":
            options = treatmentD
            break
        case "E":
            options = treatmentE
            break
        default:
            break
        }
    }
    
    func getTreatmentA(glucosa: Float, hba1c: Float) -> [Treatment] {
        if glucosa < 200 || hba1c < 8 {
            return treatmentA[0].treatments
        } else if glucosa > 250 || hba1c > 10 {
            return treatmentA[2].treatments
        } else {
            return treatmentA[1].treatments
        }
    }
    
    func getTreatmentB(glucosa: Float, hba1c: Float) -> [Treatment] {
        if glucosa < 200 || hba1c < 8 {
            return treatmentB[0].treatments
        } else if glucosa > 250 || hba1c > 10 {
            return treatmentB[2].treatments
        } else {
            return treatmentB[1].treatments
        }
    }
    
    func getTreatmentC(glucosa: Float, hba1c: Float, op: Int) -> [Treatment] {
        if glucosa < 250 || (hba1c > 8 && hba1c < 10) {
            switch op {
            case 1:
                return treatmentC[0].treatments
            case 2:
                return treatmentC[1].treatments
            case 3:
                return treatmentC[2].treatments
            case 4:
                return treatmentC[3].treatments
            default:
                return []
            }
        } else {
            switch op {
            case 5:
                return treatmentC[4].treatments
            case 6:
                return treatmentC[5].treatments
            case 7:
                return treatmentC[6].treatments
            case 8:
                return treatmentC[7].treatments
            default:
                return []
            }
        }
    }
    
    func getTreatmentD(glucosa: Float, hba1c: Float) -> [Treatment] {
        if glucosa < 200 || hba1c < 8 {
            return treatmentD[0].treatments
        } else if glucosa > 250 || hba1c > 10 {
            return treatmentD[2].treatments
        } else {
            return treatmentD[1].treatments
        }
    }
    
    func getTreatmentE(glucosa: Float, hba1c: Float) -> [Treatment] {
        if glucosa < 200 || hba1c < 8 {
            return treatmentE[0].treatments
        } else if glucosa > 250 || hba1c > 10 {
            return treatmentE[2].treatments
        } else {
            return treatmentE[1].treatments
        }
    }
    
}
