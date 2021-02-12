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

    @IBOutlet weak var weightTextInput: MDCOutlinedTextField!
    @IBOutlet weak var heightTextInput: MDCOutlinedTextField!
    @IBOutlet weak var calcButton: MDCButton!
    @IBOutlet weak var levelstextInput: MDCOutlinedTextField!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imcOutput: UILabel!
    
    var delegate: CellInfoChangeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        calcButton.setBackgroundColor(.C3())
        parentView.layer.borderColor = UIColor.C2().cgColor
        parentView.layer.cornerRadius = 8
        parentView.layer.borderWidth = 1
        
        weightTextInput.setOutlineColor(.C2(), for: .normal)
        weightTextInput.setTextColor(.C3(), for: .normal)
        weightTextInput.setOutlineColor(.C2(), for: .editing)
        weightTextInput.setTextColor(.C3(), for: .editing)
        
        heightTextInput.setOutlineColor(.C2(), for: .normal)
        heightTextInput.setTextColor(.C3(), for: .normal)
        heightTextInput.setOutlineColor(.C2(), for: .editing)
        heightTextInput.setTextColor(.C3(), for: .editing)
        
        levelstextInput.setOutlineColor(.C2(), for: .normal)
        levelstextInput.setTextColor(.C3(), for: .normal)
        levelstextInput.setOutlineColor(.C2(), for: .editing)
        levelstextInput.setTextColor(.C3(), for: .editing)
    }

    @IBAction func calculateTapped(_ sender: Any) {
        delegate?.infoChange(id: "IMC", info: 0.0)
    }
}
