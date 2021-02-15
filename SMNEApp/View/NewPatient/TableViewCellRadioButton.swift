//
//  TableViewCellRadioButton.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 03/02/21.
//

import UIKit

protocol RadioCellDelegate {
    func radioChanged(id: String, info: String)
}

class TableViewCellRadioButton: UITableViewCell {

    @IBOutlet weak var radioButtonOne: UIButton!
    @IBOutlet weak var radioButtonTwo: UIButton!
    @IBOutlet weak var parentView: UIView!
    
    var delegate: RadioCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        radioButtonOne.isSelected = true
        radioButtonOne.setImage(#imageLiteral(resourceName: "radioS"), for: .selected)
        radioButtonOne.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        radioButtonTwo.isSelected = false
        radioButtonTwo.setImage(#imageLiteral(resourceName: "radioS"), for: .selected)
        radioButtonTwo.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        parentView.layer.cornerRadius = 10
        parentView.layer.borderWidth = 1
        parentView.layer.borderColor = UIColor.C00D9CC().cgColor
    }
    
    @IBAction func radioOneTapped(_ sender: Any) {
        radioButtonOne.isSelected = true
        radioButtonTwo.isSelected = false
        delegate?.radioChanged(id: "racial", info: "No afroamericano")
    }
    @IBAction func radioTwoTapped(_ sender: Any) {
        radioButtonTwo.isSelected = true
        radioButtonOne.isSelected = false
        delegate?.radioChanged(id: "racial", info: "Afroamericano")
    }
    
}
