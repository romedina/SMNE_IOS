//
//  TableViewCellAlgorithSelection.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton
class TableViewCellAlgorithmSelection: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var algorithmLabel: UILabel!
    @IBOutlet weak var selectButton: MDCButton!
    var superV: TableViewControllerNewPatient_S3!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 10
        selectButton.setBackgroundColor(.white, for: .normal)
        superV = TableViewControllerNewPatient_S3()
    }
    
    func setInfo(algorithm: String, backColor: UIColor, textColor: UIColor, viewController: TableViewControllerNewPatient_S3) {
        parentView.backgroundColor = backColor
        algorithmLabel.textColor = textColor
        algorithmLabel.text = algorithm
        superV = viewController
    }
    
    @IBAction func selectButtonTapped(_ sender: Any) {
        superV.algorithmSelected()
    }
    
}
