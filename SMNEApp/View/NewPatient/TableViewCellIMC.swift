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
    @IBOutlet weak var calcButton: MDCButton!
    @IBOutlet weak var levelstextInput: MDCTextField!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imcOutput: UILabel!
    
    var weightController: MDCTextInputControllerOutlined?
    var heightController: MDCTextInputControllerOutlined?
    var levelController: MDCTextInputControllerOutlined?
    
    var delegate: CellInfoChangeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        calcButton.setBackgroundColor(.white)
        calcButton.setTitleColor(.white, for: .normal)
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
    }
    
    private func calculateIMC() {
        
    }

    @IBAction func calculateTapped(_ sender: Any) {
        delegate?.infoChange(id: "IMC", info: 0.0)
    }
}
