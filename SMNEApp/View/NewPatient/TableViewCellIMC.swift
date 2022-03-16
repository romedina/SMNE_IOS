//
//  TableViewCellIMC.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 03/02/21.
//

import UIKit

protocol CellInfoChangeDelegate {
    func infoChange(id: String, info: Float)
    func infoChange(id: String, info: String)
    func infoChange(id: String, info: Bool)
}

class TableViewCellIMC: UITableViewCell {

    @IBOutlet weak var weightTextInput: SMNETextField!
    @IBOutlet weak var heightTextInput: SMNETextField!
    @IBOutlet weak var levelstextInput: SMNETextField!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imcOutput: UILabel!
    
    var delegate: CellInfoChangeDelegate?
    
    var height: Float = 0.0
    var weight: Float = 0.0
    var levels: Float = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.borderColor = UIColor.C00D9CC().cgColor
        parentView.layer.cornerRadius = 5.39
        parentView.layer.borderWidth = 1
        
        let color: UIColor = UIColor(red: 0.4, green: 0.29, blue: 0.49, alpha: 1.0)
        let label = UILabel()
        label.text = "kg"
        label.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label.textColor = color
        weightTextInput.rightViewMode = .always
        weightTextInput.rightView = label
        
        let label1 = UILabel()
        label1.text = "m"
        label1.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label1.textColor = color
        heightTextInput.rightViewMode = .always
        heightTextInput.rightView = label1
        
        let label2 = UILabel()
        label2.text = "mg/dl"
        label2.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label2.textColor = color
        levelstextInput.setTrailingView(trailingView: label2)
        
        imcOutput.text = "0.0"
        
        weightTextInput.setTextFieldLook()
        heightTextInput.setTextFieldLook()
        levelstextInput.setTextFieldLook()
    }
    
    private func calculateIMC() {
        let imc = weight / (pow(height, 2))
        if weight == 0.0 || height == 0.0 {
            imcOutput.text = "0.0"
            delegate?.infoChange(id: "IMC", info: 0.0)
        } else {
            let roundedIMC = (imc * 100).rounded() / 100
            imcOutput.text = "\(roundedIMC)"
            delegate?.infoChange(id: "IMC", info: roundedIMC)
        }
    }
    
    func setValues(height: Double, weight: Double, levels: Double, imc: Double) {
        heightTextInput.text = String(format: "%.2f", height)
        self.height = Float(String(format: "%.2f", height)) ?? 0.0
        weightTextInput.text = String(format: "%.2f", weight)
        self.weight = Float(String(format: "%.2f", weight)) ?? 0.0
        levelstextInput.text = String(format: "%.2f", levels)
        self.levels = Float(String(format: "%.2f", levels)) ?? 0.0
        imcOutput.text = String(format: "%.2f", imc)
    }

    @IBAction func weightChanged(_ sender: UITextField) {
        let string = sender.text ?? "0"
        weight = Float(string) ?? 0.0
        if weight >= 30 || weight <= 200 {
            weightTextInput.setNormal()
        }
        delegate?.infoChange(id: "weight", info: weight)
        calculateIMC()
    }
    @IBAction func heightChanged(_ sender: UITextField) {
        var string = sender.text ?? "0"
        var doubleCero = false
        let lastFromString = string.popLast()
        if string == "0.20" && lastFromString == "0" {
            doubleCero = true
        }
        string = string.replacingOccurrences(of: "0", with: "")
        string = string.replacingOccurrences(of: ".", with: "")
        if string.count < 3 && lastFromString != nil {
            string.append(lastFromString!)
            if doubleCero {
                string.append(lastFromString!)
            }
        }
        guard var floatValue = Float(string) else { return }
        floatValue /= 100
        if floatValue > 1.29 && floatValue < 2.1 {
            heightTextInput.setNormal()
        }
        sender.text = String(format: "%.2f", floatValue)
        height = Float(sender.text ?? "") ?? 0.0
        delegate?.infoChange(id: "height", info: height)
        calculateIMC()
    }
    @IBAction func levelsChanged(_ sender: UITextField) {
        let string = sender.text ?? "0"
        levels = Float(string) ?? 0.0
        levelstextInput.setNormal()
        delegate?.infoChange(id: "levels", info: levels)
    }
}
