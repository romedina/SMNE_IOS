//
//  TableViewCellIMC.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 03/02/21.
//

import UIKit
import MaterialComponents

protocol CellInfoChangeDelegate {
    func infoChange(id: String, info: Float)
    func infoChange(id: String, info: String)
    func infoChange(id: String, info: Bool)
}

class TableViewCellIMC: UITableViewCell {

    @IBOutlet weak var weightTextInput: MDCTextField!
    @IBOutlet weak var heightTextInput: MDCTextField!
    @IBOutlet weak var levelstextInput: MDCTextField!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imcOutput: UILabel!
    
    var weightController: MDCTextInputControllerOutlined?
    var heightController: MDCTextInputControllerOutlined?
    var levelController: MDCTextInputControllerOutlined?
    
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
        
        weightController = MDCTextInputControllerOutlined(textInput: weightTextInput)
        weightController?.applyTheme(withScheme: appTheme)
        weightController?.textInput?.textColor = .C052D6C()
        heightController = MDCTextInputControllerOutlined(textInput: heightTextInput)
        heightController?.applyTheme(withScheme: appTheme)
        heightController?.textInput?.textColor = .C052D6C()
        levelController = MDCTextInputControllerOutlined(textInput: levelstextInput)
        levelController?.applyTheme(withScheme: appTheme)
        levelController?.textInput?.textColor = .C052D6C()
        
        let color: UIColor = UIColor(red: 0.4, green: 0.29, blue: 0.49, alpha: 1.0)
        let label = UILabel()
        label.text = "kg"
        label.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label.textColor = color
        weightTextInput.trailingViewMode = .always
        weightTextInput.trailingView = label
        
        let label1 = UILabel()
        label1.text = "m"
        label1.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label1.textColor = color
        heightTextInput.trailingViewMode = .always
        heightTextInput.trailingView = label1
        
        let label2 = UILabel()
        label2.text = "mg/dl"
        label2.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label2.textColor = color
        levelstextInput.trailingViewMode = .always
        levelstextInput.trailingView = label2
        
        imcOutput.text = "0.0"
    }
    
    private func calculateIMC() {
        let imc = weight / (pow(height, 2))
        if weight == 0.0 || height == 0.0 {
            imcOutput.text = "0.0"
            delegate?.infoChange(id: "IMC", info: 0.0)
        } else {
            imcOutput.text = "\(imc)"
            delegate?.infoChange(id: "IMC", info: imc)
        }
    }
    
    func setValues(height: Double, weight: Double, levels: Double, imc: Double) {
        heightTextInput.text = "\(height)"
        self.height = Float(height)
        weightTextInput.text = "\(weight)"
        self.weight = Float(weight)
        levelstextInput.text = "\(levels)"
        self.levels = Float(levels)
        imcOutput.text = "\(imc)"
    }

    @IBAction func weightChanged(_ sender: UITextField) {
        let string = sender.text ?? "0"
        weight = Float(string) ?? 0.0
        if weight < 30 || weight > 200 {
            weightController?.errorColor = .red
            weightController?.setErrorText("Valores fuera de rango", errorAccessibilityValue: nil)
        } else {
            weightController?.setErrorText(nil, errorAccessibilityValue: nil)
            delegate?.infoChange(id: "weight", info: weight)
        }
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
            heightController?.setErrorText(nil, errorAccessibilityValue: nil)
        } else {
            heightController?.errorColor = .red
            heightController?.setErrorText("Valores fuera de rango", errorAccessibilityValue: nil)
            delegate?.infoChange(id: "height", info: height)
        }
        sender.text = String(format: "%.2f", floatValue)
        height = Float(sender.text ?? "") ?? 0.0
        calculateIMC()
    }
    @IBAction func levelsChanged(_ sender: UITextField) {
        let string = sender.text ?? "0"
        levels = Float(string) ?? 0.0
        if levels <= 5 && levels >= 0 {
            levelController?.setErrorText(nil, errorAccessibilityValue: nil)
            delegate?.infoChange(id: "levels", info: levels)
        } else {
            levelController?.errorColor = .red
            levelController?.setErrorText("Valores fuera de rango", errorAccessibilityValue: nil)
        }
    }
}
