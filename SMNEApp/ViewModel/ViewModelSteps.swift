//
//  ViewModelSteps.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import Foundation

let step1Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepOne {
        if let _ = cell as? TitleCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()

let step2Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepTwo {
        if let _ = cell as? TitleCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()

class ReinitStepCells {
    func reinitS3() {
        step3Cells = {
            var cells: [Any] = []
            for cell in stepThree {
                if let _ = cell as? TitleCell { } else {
                    cells.append(cell)
                }
            }
            return cells
        }()
    }
    
    func reinitS4() {
        step4Cells = {
            var cells: [Any] = []
            for cell in stepFour {
                if let _ = cell as? TitleCell { } else {
                    cells.append(cell)
                }
            }
            return cells
        }()
    }
}

var step3Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepThree {
        if let _ = cell as? TitleCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()

var step4Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepFour {
        if let _ = cell as? TitleCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()

var step5Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepFive {
        if let _ = cell as? TitleCell { } else if let name = cell as? String { } else {
            cells.append(cell)
        }
    }
    return cells
}()


