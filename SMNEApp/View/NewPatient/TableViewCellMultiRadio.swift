//
//  TableViewCellMultiRadio.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 19/02/21.
//

import UIKit

class TableViewCellMultiRadio: UITableViewCell {
    
    //Views
    @IBOutlet weak var op1View: UIView!
    @IBOutlet weak var op2View: UIView!
    @IBOutlet weak var op3View: UIView!
    @IBOutlet weak var op4View: UIView!
    
    //Buttons
    @IBOutlet weak var op1Button: UIButton!
    @IBOutlet weak var op2Button: UIButton!
    @IBOutlet weak var op3Button: UIButton!
    @IBOutlet weak var op4Button: UIButton!
    
    var delegate: CellInfoChangeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func op1Tapped(_ sender: Any) {
        delegate?.infoChange(id: "filter", info: "<15")
        reset()
        op1Button.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        op2Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op3Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op4Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
    }
    
    @IBAction func op2Tapped(_ sender: Any) {
        delegate?.infoChange(id: "filter", info: "15-29")
        reset()
        op1Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op2Button.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        op3Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op4Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
    }
    
    @IBAction func op3Tapped(_ sender: Any) {
        delegate?.infoChange(id: "filter", info: "30-44")
        reset()
        op1Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op2Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op3Button.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        op4Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
    }
    
    @IBAction func op4Tapped(_ sender: Any) {
        delegate?.infoChange(id: "filter", info: "45-59")
        reset()
        op1Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op2Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op3Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        op4Button.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
    }
    
    private func reset() {
        op1View.layer.borderColor = UIColor.clear.cgColor
        op2View.layer.borderColor = UIColor.clear.cgColor
        op3View.layer.borderColor = UIColor.clear.cgColor
        op4View.layer.borderColor = UIColor.clear.cgColor
    }
}
