//
//  TableViewCellAlgorithSelection.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit

protocol AlgorithmSelectedDelegate {
    func algorithmSelected(option: Int, ID: String)
}
class TableViewCellAlgorithmSelection: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var algorithmLabel: UILabel!
    @IBOutlet weak var selectButton: SMNEButton!
    var superV: TableViewControllerNewPatient_S3!
    var row = 0
    var algorithmID = ""
    
    var delegate: AlgorithmSelectedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 10
        selectButton.setBackgroundColor(.white)
        superV = TableViewControllerNewPatient_S3()
    }
    
    func setInfo(algorithm: String, backColor: UIColor, textColor: UIColor, viewController: TableViewControllerNewPatient_S3, indexP: Int, ID: String) {
        parentView.backgroundColor = backColor
        algorithmLabel.textColor = textColor
        algorithmLabel.text = algorithm
        superV = viewController
        row = indexP
        algorithmID = ID
    }
    
    @IBAction func selectButtonTapped(_ sender: Any) {
        delegate?.algorithmSelected(option: row, ID: algorithmID)
    }
    
}
