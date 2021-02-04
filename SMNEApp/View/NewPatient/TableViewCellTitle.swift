//
//  TableViewCellTitle.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit

class TableViewCellTitle: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInfo(title: String, subtitle: String){
        titleLabel.text = title
        if subtitleLabel != nil {
            subtitleLabel.text = subtitle
        }
    }

}
