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
        let index = patientId.index(patientId.startIndex, offsetBy: 8)
        let mySubstring = patientId[..<index] // Hello
        patientIDLabel.text = "\(String(mySubstring))..."
        
        let today = Date()
        
        dateLabel.text = today.dateToMxnString()
    }

}

extension Date {
    func dateToMxnString() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let dateIng = formatter.string(from: self)
        let separated = dateIng.split(separator: "/")
        let dateMX = "\(separated[1])/\(separated[0])/20\(separated[2])"
        
        return dateMX
    }
}
