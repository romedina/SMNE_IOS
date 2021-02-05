//
//  TableViewCellStartOption.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit

class TableViewCellStartOption: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var optionButton: UIButton!
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
    }

}
