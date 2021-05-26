//
//  TableViewCellDeterioration.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/04/21.
//

import UIKit

class TableViewCellDeterioration: UITableViewCell {

    @IBOutlet weak var lowDButton: UIButton!
    @IBOutlet weak var mediumDButton: UIButton!
    @IBOutlet weak var highDButton: UIButton!
    @IBOutlet weak var lowHipoButton: UIButton!
    @IBOutlet weak var highHipoButton: UIButton!
    
    var delegate: CellInfoChangeDelegate?
    
    var map = [-1,-1]
    
    var metas = [[7.5, 8.0, 8.5], [7.5, 8.0, 8.5]]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lowHipoButton.layer.borderWidth = 1
        highHipoButton.layer.borderWidth = 1
        lowHipoButton.layer.borderColor = UIColor.C00D9CC().cgColor
        highHipoButton.layer.borderColor = UIColor.C00D9CC().cgColor
        lowHipoButton.layer.cornerRadius = 8
        highHipoButton.layer.cornerRadius = 8
        lowHipoButton.titleLabel?.textAlignment = .center
        highHipoButton.titleLabel?.textAlignment = .center
    }

    @IBAction func deteriorationLevelTapped(_ sender: UIButton) {
        lowDButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        mediumDButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        highDButton.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
        
        sender.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
        switch sender {
        case lowDButton:
            map[0] = 0
            PatientSelected.shared.patientDet = nil
            break
        case mediumDButton:
            map[0] = 1
            PatientSelected.shared.patientDet = 1
            break
        case highDButton:
            map[0] = 2
            PatientSelected.shared.patientDet = 2
            break
        default:
            break
        }
        sendInfo()
    }
    
    @IBAction func hipoLevelTapped(_ sender: UIButton) {
        lowHipoButton.backgroundColor = .white
        lowHipoButton.setTitleColor(.C00D9CC(), for: .normal)
        highHipoButton.backgroundColor = .white
        highHipoButton.setTitleColor(.C00D9CC(), for: .normal)
        
        sender.backgroundColor = .C00D9CC()
        sender.setTitleColor(.white, for: .normal)
        
        switch sender {
        case lowHipoButton:
            map[1] = 0
            break
        case highHipoButton:
            map[1] = 1
            break
        default:
            break
        }
        sendInfo()
    }
    
    private func sendInfo() {
        if map[0] != -1 && map[1] != -1 {
            let meta = Float(metas[map[1]][map[0]])
            print("meta: \(meta)")
            delegate?.infoChange(id: "meta", info: meta)
        }
    }
}
