//
//  TableViewCellStartOption.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit

protocol StartOptionDelegate {
    func optionSelected(option: String)
}

class TableViewCellStartOption: UITableViewCell {
    
    enum Options {
        case Diagnostic
        case Algorithm
        case Patients
    }
    
    var option: Options = .Diagnostic
    var delegate: StartOptionDelegate?

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var optionButton: SMNEButton!
    @IBOutlet weak var imageViewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 15
        optionButton.layer.cornerRadius = 8
    }
    
    func setInfo(titleText: String, buttonTitle: String, textColor: UIColor, backColor: UIColor, image: UIImage) {
        titleLabel.text = titleText
        optionButton.setTitle(buttonTitle, for: .normal)
        titleLabel.textColor = textColor
        parentView.backgroundColor = backColor
        imageViewImage.image = image
        if buttonTitle == "Iniciar diagnóstico" {
            self.option = .Diagnostic
        } else if buttonTitle == "Ver documento" {
            self.option = .Algorithm
        } else {
            self.option = .Patients
        }
    }
    
    @IBAction func optionTapped(_ sender: Any) {
        switch option {
        case .Diagnostic:
            delegate?.optionSelected(option: "diagnostic")
            break
        case .Algorithm:
            delegate?.optionSelected(option: "algorithm")
            break
        case .Patients:
            delegate?.optionSelected(option: "patients")
            break
        }
    }
    

}
