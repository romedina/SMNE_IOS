//
//  TableViewCellNewRevition.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 19/03/21.
//

import UIKit

class TableViewCellNewRevition: UITableViewCell {
    
    @IBOutlet weak var evaluationLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    
    var delegate: NewRevitionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        applyButton.layer.borderWidth = 1
        applyButton.layer.borderColor = UIColor(red: 0, green: 217, blue: 204, alpha: 1).cgColor
        applyButton.layer.cornerRadius = 10
    }
    
    func setInfo(number: Int) {
        evaluationLabel.text = "Evaluación \(number)"
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        delegate?.newRevition()
    }
    
}
