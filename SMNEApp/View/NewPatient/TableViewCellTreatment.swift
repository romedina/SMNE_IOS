//
//  TableViewCellTreatment.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit

class TableViewCellTreatment: UITableViewCell {
    
    @IBOutlet weak var treatmentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInfo(imageName: String) {
        treatmentImageView.image = UIImage(named: imageName)
    }

}
