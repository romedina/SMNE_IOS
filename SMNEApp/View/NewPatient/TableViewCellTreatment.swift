//
//  TableViewCellTreatment.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit

class TableViewCellTreatment: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 10
    }
    
    func setInfo(title: String, subTitle: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }

}
