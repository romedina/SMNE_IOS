//
//  TableViewCellBool.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit

protocol SubToCellDelegate {
    func changeERC(_ has: Bool)
    func changeHipo(_ has: Bool)
}

class TableViewCellBool: UITableViewCell, SubToCellDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var yesButton: SMNEButton!
    @IBOutlet weak var noButton: SMNEButton!
    
    var delegate: CellInfoChangeDelegate?
    var openModalDelegate: OpenFromLabelDelegate?
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
            if id == "hipo" {
                setLabelAction(simpleText: sub)
            }
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
    
    public func disableButtons() {
        yesButton.isUserInteractionEnabled = false
        noButton.isUserInteractionEnabled = false
    }
    
    private func setLabelAction(simpleText: String) {
        let splittedText = simpleText.split(separator: "/")
        let firstString = NSMutableAttributedString(
            string: String(splittedText[0]),
            attributes: [
                .font: UIFont(name: "Open Sans Regular", size: 13.0) ?? UIFont.systemFont(ofSize: 15.0),
                .foregroundColor: UIColor.C707070()
            ]
        )
        
        let attributeString = NSMutableAttributedString(
            string: String(splittedText[1]),
            attributes: [
                .font: UIFont(name: "Open Sans Regular", size: 13.0) ?? UIFont.systemFont(ofSize: 15.0),
                .foregroundColor: UIColor.C00D9CC(),
                .underlineStyle: NSUnderlineStyle.single.rawValue,
            ]
        )
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        let mString = NSMutableAttributedString()
        mString.append(firstString)
        mString.append(attributeString)
        
        subLabel.attributedText = mString
        subLabel.isUserInteractionEnabled = true
        subLabel.addGestureRecognizer(tap)
    }
    
    @objc private func labelTapped() {
        openModalDelegate?.openModal()
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
    
    func changeHipo(_ has: Bool) {
        if id == "hipo" {
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
