//
//  TableViewCellOpen.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit

protocol OpenCellDelegate {
    func openChanged(id: String, info: Any)
}

class TableViewCellOpen: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openInput: SMNETextField!
    
    var delegate: OpenCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        openInput.keyboardType = .decimalPad
        openInput.returnKeyType = .done
    }
    
    func setInfo(title: String, placeHolder: String) {
        titleLabel.text = title
        openInput.placeholder = placeHolder
        
        if PatientSelected.shared.patientInfo != nil {
            switch title {
            case "Edad":
                openInput.text = "\(PatientSelected.shared.patientInfo?.age ?? 0)"
            case "Año en que se diagnosticó la diabetes":
                openInput.text = "\(PatientSelected.shared.patientInfo?.diagnosisYear ?? 0)"
            default:
                break
            }
        }
    }
    @IBAction func openChanged(_ sender: SMNETextField) {
        openInput.setNormal()
        if titleLabel.text == "Edad" {
            if sender.text!.count > 3 {
                let _ = sender.text?.popLast()
            }
            delegate?.openChanged(id: "age", info: sender.text ?? "")
        } else {
            if sender.text!.count > 4 {
                let _ = sender.text?.popLast()
            }
            openInput.setNormal()
            delegate?.openChanged(id: "diabetes", info: sender.text ?? "")
        }
    }
}
