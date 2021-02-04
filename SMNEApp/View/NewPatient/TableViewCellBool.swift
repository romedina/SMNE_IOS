//
//  TableViewCellBool.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton

class TableViewCellBool: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yesButton: MDCButton!
    @IBOutlet weak var noButton: MDCButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        yesButton.setBorderWidth(1.0, for: .normal)
        yesButton.setBorderColor(.C2(), for: .normal)
        yesButton.setBackgroundColor(.white, for: .normal)
        yesButton.setBackgroundColor(.C2(), for: .selected)
        yesButton.setTitleColor(.white, for: .selected)
        noButton.setBorderWidth(1.0, for: .normal)
        noButton.setBorderColor(.C2(), for: .normal)
        noButton.setBackgroundColor(.white, for: .normal)
        noButton.setBackgroundColor(.C2(), for: .selected)
        noButton.setTitleColor(.white, for: .selected)
    }
    
    func setInfo(title: String) {
        titleLabel.text = title
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        if !yesButton.isSelected {
            yesButton.isSelected = true
            noButton.isSelected = false
        }
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        if !noButton.isSelected {
            noButton.isSelected = true
            yesButton.isSelected = false
        }
    }
    
}