//
//  TableViewCellOpenOpen.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 15/02/21.
//

import UIKit

class TableViewCellOpenOpen: UITableViewCell {
    
    @IBOutlet weak var title1Label: UILabel!
    @IBOutlet weak var open1Input: SMNETextField!
    @IBOutlet weak var title2Label: UILabel!
    @IBOutlet weak var open2Input: SMNETextField!
    
    var id1 = ""
    var id2 = ""
    
    var delegate: CellInfoChangeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInfo(t1: String, t2: String, tr1: String, tr2: String, id1: String, id2: String) {
        title1Label.text = t1
        title2Label.text = t2
        
        self.id1 = id1
        self.id2 = id2
        
        let color: UIColor = UIColor(red: 0.4, green: 0.29, blue: 0.49, alpha: 1.0)
        let label = UILabel()
        label.text = tr1
        label.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label.textColor = color
        open1Input.rightViewMode = .always
        open1Input.rightView = label
        
        let label1 = UILabel()
        label1.text = tr2
        label1.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label1.textColor = color
        open2Input.setTrailingView(trailingView: label1)
    }
    
    func setValues(v1: String, v2: String) {
        open1Input.text = v1
        open2Input.text = v2
    }

    @IBAction func open1(_ sender: SMNETextField) {
        var text = sender.text ?? "0"
        if id1 == "name" {
            open1Input.setNormal()
            delegate?.infoChange(id: id1, info: text)
        } else if id1 == "hba1c" {
            open2Input.setNormal()
            if text.last == "." {
                let _ = String(text.removeLast())
                if text.contains(".") {
                    sender.text = text
                }
            }
            let myFloat = (text as NSString).floatValue
//            if myFloat < 4.5 || myFloat > 20 {
////                input1Controller?.setErrorText("Valor fuera de rango", errorAccessibilityValue: nil)
////                input1Controller?.errorColor = .red
//            } else {
//            }
            open1Input.setNormal()
            delegate?.infoChange(id: id1, info: myFloat)
        } else {
            let myFloat = (text as NSString).floatValue
            open1Input.setNormal()
            delegate?.infoChange(id: id1, info: myFloat)
//            if myFloat < 4.5 || myFloat > 20 {
////                input1Controller?.setErrorText("Valor fuera de rango", errorAccessibilityValue: nil)
////                input1Controller?.errorColor = .red
//            } else {
//            }
        }
    }
    
    @IBAction func open2(_ sender: SMNETextField) {
        let text = sender.text ?? "0"
        if id2 == "lastName" {
            open2Input.setNormal()
            delegate?.infoChange(id: id2, info: text)
        } else {
            let myFloat = (text as NSString).floatValue
            open1Input.setNormal()
            open2Input.setNormal()
            delegate?.infoChange(id: id2, info: myFloat)
            if myFloat < 20 || myFloat > 1000 {
//                input2Controller?.setErrorText("Valor fuera de rango", errorAccessibilityValue: nil)
//                input2Controller?.errorColor = .red
            } else {
            }
        }
    }
}
