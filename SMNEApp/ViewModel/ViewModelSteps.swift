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
        if let _ = cell as? TitleCell { } else if let _ = cell as? StepperCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()

let step2Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepTwo {
        if let _ = cell as? TitleCell { } else if let _ = cell as? StepperCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()

let step3Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepThree {
        if let _ = cell as? TitleCell { } else if let _ = cell as? StepperCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()

let step4Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepFour {
        if let _ = cell as? TitleCell { } else if let _ = cell as? StepperCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()

let step5Cells: [Any] = {
    var cells: [Any] = []
    for cell in stepFive {
        if let _ = cell as? TitleCell { } else if let _ = cell as? StepperCell { } else {
            cells.append(cell)
        }
    }
    return cells
}()


