//
//  TableViewCellOpen.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit
import MaterialComponents

protocol OpenCellDelegate {
    func openChanged(id: String, info: Any)
}

class TableViewCellOpen: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openInput: MDCTextField!
    
    var openController: MDCTextInputControllerOutlined?
    
    var delegate: OpenCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        openInput.keyboardType = .decimalPad
        openInput.returnKeyType = .done
        
        openController = MDCTextInputControllerOutlined(textInput: openInput)
        
        openController?.applyTheme(withScheme: appTheme)
        openController?.textInput?.textColor = .C052D6C()
    }
    
    func setInfo(title: String, placeHolder: String) {
        titleLabel.text = title
        openInput.placeholder = placeHolder
    }
    @IBAction func openChanged(_ sender: MDCOutlinedTextField) {
        if titleLabel.text == "Edad" {
            delegate?.openChanged(id: "age", info: sender.text ?? "")
        } else {
            delegate?.openChanged(id: "diabetes", info: sender.text ?? "")
        }
    }
}
