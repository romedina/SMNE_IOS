//
//  TableViewCellPatientList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit

class TableViewCellPatientList: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imagePatientView: UIView!
    @IBOutlet weak var patientImage: UIImageView!
    @IBOutlet weak var patientIdLabel: UILabel!
    @IBOutlet weak var patientInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 10
        parentView.layer.borderWidth = 1
        parentView.layer.borderColor = UIColor(red: 0.75, green: 0.93, blue: 0.94, alpha: 1.0).cgColor
        imagePatientView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
