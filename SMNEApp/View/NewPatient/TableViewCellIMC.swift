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
        calcButton.setBackgroundColor(.C052D6C())
        calcButton.layer.cornerRadius = 5.39
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
    }
    
    private func calculateIMC() {
        
    }

    @IBAction func calculateTapped(_ sender: Any) {
        delegate?.infoChange(id: "IMC", info: 0.0)
    }
}
