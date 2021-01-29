//
//  TableViewCellInfoPatient.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit

class TableViewCellInfoPatient: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var patientIDLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconImage.layer.cornerRadius = 23
    }
    
    func setInfo(patientId: String) {
        patientIDLabel.text = patientId
        
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        let dateIng = formatter1.string(from: today)
        
        let dateSeparated = dateIng.split(separator: "/")
        let dateMX = "\(dateSeparated[1])/\(dateSeparated[0])/\(dateSeparated[2])"
        dateLabel.text = dateMX
    }

}
