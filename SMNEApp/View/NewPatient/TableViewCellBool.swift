//
//  TableViewCellBool.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton

protocol SubToCellDelegate {
    func changeERC(_ has: Bool)
}

class TableViewCellBool: UITableViewCell, SubToCellDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var yesButton: MDCButton!
    @IBOutlet weak var noButton: MDCButton!
    
    var delegate: CellInfoChangeDelegate?
    var id: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        yesButton.setBorderWidth(1.0, for: .normal)
        yesButton.setBorderColor(.C00D9CC(), for: .normal)
        yesButton.setBackgroundColor(.white, for: .normal)
        yesButton.setBackgroundColor(.C00D9CC(), for: .selected)
        yesButton.setTitleColor(.white, for: .selected)
        noButton.setBorderWidth(1.0, for: .normal)
        noButton.setBorderColor(.C00D9CC(), for: .normal)
        noButton.setBackgroundColor(.white, for: .normal)
        noButton.setBackgroundColor(.C00D9CC(), for: .selected)
        noButton.setTitleColor(.white, for: .selected)
    }
    
    func setInfo(title: String, sub: String, id: String) {
        titleLabel.text = title
        subLabel.text = sub
        if sub == "" {
            subLabel.isHidden = true
        } else {
            subLabel.isHidden = false
        }
        self.id = id
        
        if PatientSelected.shared.patientInfo != nil {
            switch id {
            case "renal":
                let value = PatientSelected.shared.patientInfo?.evaluations.last?.chronicKidneyDisease ?? false
                if value {
                    noButton.isSelected = false
                    yesButton.isSelected = true
                } else {
                    yesButton.isSelected = false
                    noButton.isSelected = true
                }
            case "cardio":
                let value = PatientSelected.shared.patientInfo?.evaluations.last?.cardiovascularComplications ?? false
                if value {
                    noButton.isSelected = false
                    yesButton.isSelected = true
                } else {
                    yesButton.isSelected = false
                    noButton.isSelected = true
                }
            case "hipo":
                let value = PatientSelected.shared.patientInfo?.evaluations.last?.hypoglycemia ?? false
                if value {
                    noButton.isSelected = false
                    yesButton.isSelected = true
                } else {
                    yesButton.isSelected = false
                    noButton.isSelected = true
                }
            default:
                break
            }
        }
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        yesButton.setBorderColor(.C00D9CC(), for: .normal)
        noButton.setBorderColor(.C00D9CC(), for: .normal)
        if !yesButton.isSelected {
            yesButton.isSelected = true
            noButton.isSelected = false
            delegate?.infoChange(id: id, info: true)
        }
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        yesButton.setBorderColor(.C00D9CC(), for: .normal)
        noButton.setBorderColor(.C00D9CC(), for: .normal)
        if !noButton.isSelected {
            noButton.isSelected = true
            yesButton.isSelected = false
            delegate?.infoChange(id: id, info: false)
        }
    }
    
    func changeERC(_ has: Bool) {
        if id == "renal" {
            yesButton.setBorderColor(.C00D9CC(), for: .normal)
            noButton.setBorderColor(.C00D9CC(), for: .normal)
            if has {
                yesButton.isSelected = true
                noButton.isSelected = false
                delegate?.infoChange(id: id, info: true)
            } else {
                yesButton.isSelected = false
                noButton.isSelected = true
                delegate?.infoChange(id: id, info: false)
            }
        }
    }
    
}
