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
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var yesButton: MDCButton!
    @IBOutlet weak var noButton: MDCButton!
    
    var delegate: CellInfoChangeDelegate?
    var id: String = ""
    
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
    
    func setInfo(title: String, sub: String, id: String) {
        titleLabel.text = title
        subLabel.text = sub
        self.id = id
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        if !yesButton.isSelected {
            yesButton.isSelected = true
            noButton.isSelected = false
            delegate?.infoChange(id: id, info: true)
        }
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        if !noButton.isSelected {
            noButton.isSelected = true
            yesButton.isSelected = false
            delegate?.infoChange(id: id, info: false)
        }
    }
    
}
