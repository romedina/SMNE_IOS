//
//  TableViewCellSlider.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents

class TableViewCellSlider: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.borderWidth = 1
        parentView.layer.borderColor = UIColor.C00D9CC().cgColor
        parentView.layer.cornerRadius = 10
    }
    
    func setInfo(title: String, max: String, unit: String) {
        titleLabel.text = title
        maxLabel.text = max
        unitLabel.text = unit
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        selectLabel.text = slider.value.clean
    }

}

extension Float {
    var clean: String {
        return String(Int(self))
    }
}

class CustomSlide: UISlider {
    @IBInspectable var trackHeight: CGFloat = 2
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
    }
}
