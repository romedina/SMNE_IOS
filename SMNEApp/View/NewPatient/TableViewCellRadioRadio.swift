//
//  TableViewCellRadioRadio.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 10/02/21.
//

import UIKit

protocol RadioRadioDelegate {
    func radioChanged(id: String, info: String)
}

class TableViewCellRadioRadio: UITableViewCell {

    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var genderView: UIView!
    
    @IBOutlet weak var privateButton: UIButton!
    @IBOutlet weak var publicButton: UIButton!
    @IBOutlet weak var femButton: UIButton!
    @IBOutlet weak var masButton: UIButton!
    
    var delegate: RadioRadioDelegate?
    
    var deselectedImage: UIImage = #imageLiteral(resourceName: "radioNS")
    var selectImage: UIImage = #imageLiteral(resourceName: "radioS")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        typeView.layer.borderWidth = 1
        typeView.layer.borderColor = UIColor.C00D9CC().cgColor
        typeView.layer.cornerRadius = 8
        
        genderView.layer.borderWidth = 1
        genderView.layer.borderColor = UIColor.C00D9CC().cgColor
        genderView.layer.cornerRadius = 8
        
        privateButton.setImage(deselectedImage, for: .normal)
        privateButton.setImage(selectImage, for: .selected)
        
        publicButton.setImage(deselectedImage, for: .normal)
        publicButton.setImage(selectImage, for: .selected)
        
        femButton.setImage(deselectedImage, for: .normal)
        femButton.setImage(selectImage, for: .selected)
        
        masButton.setImage(deselectedImage, for: .normal)
        masButton.setImage(selectImage, for: .selected)
    }
    
    func setValues(v1: ConsultationEnum, v2: GenderEnum) {
        switch v1 {
        case .privada:
            privateButton.isSelected = true
            publicButton.isSelected = false
            break
        case .publica:
            privateButton.isSelected = false
            publicButton.isSelected = true
            break
        }
        
        switch v2 {
        case .fem:
            femButton.isSelected = true
            masButton.isSelected = false
        case .mas:
            femButton.isSelected = false
            masButton.isSelected = true
        }
    }
    
    @IBAction func privateTapped(_ sender: Any) {
        privateButton.isSelected = true
        publicButton.isSelected = false
        typeView.layer.borderColor = UIColor.C00D9CC().cgColor
        delegate?.radioChanged(id: "type", info: "private")
    }
    @IBAction func publicTapped(_ sender: Any) {
        privateButton.isSelected = false
        publicButton.isSelected = true
        typeView.layer.borderColor = UIColor.C00D9CC().cgColor
        delegate?.radioChanged(id: "type", info: "public")
    }
    @IBAction func femTapped(_ sender: Any) {
        femButton.isSelected = true
        masButton.isSelected = false
        genderView.layer.borderColor = UIColor.C00D9CC().cgColor
        delegate?.radioChanged(id: "gender", info: "fem")
    }
    @IBAction func masTapped(_ sender: Any) {
        femButton.isSelected = false
        masButton.isSelected = true
        genderView.layer.borderColor = UIColor.C00D9CC().cgColor
        delegate?.radioChanged(id: "gender", info: "mas")
    }
    
}
