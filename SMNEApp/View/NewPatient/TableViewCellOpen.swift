//
//  TableViewCellOpen.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit
import MaterialComponents

class TableViewCellOpen: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openInput: MDCOutlinedTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        openInput.keyboardType = .decimalPad
        openInput.returnKeyType = .done
        
        openInput.setOutlineColor(.C2(), for: .normal)
        openInput.setTextColor(.C3(), for: .normal)
        openInput.setOutlineColor(.C2(), for: .editing)
        openInput.setTextColor(.C3(), for: .editing)
    }
    
    func setInfo(title: String, placeHolder: String) {
        titleLabel.text = title
        openInput.placeholder = placeHolder
    }
}
