//
//  TableViewCellStepper.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit

class TableViewCellStepper: UITableViewCell {

    @IBOutlet weak var step1: UIButton!
    @IBOutlet weak var step1L: UIView!
    @IBOutlet weak var step2: UIButton!
    @IBOutlet weak var step2L: UIView!
    @IBOutlet weak var step3: UIButton!
    @IBOutlet weak var step3L: UIView!
    @IBOutlet weak var step4: UIButton!
    @IBOutlet weak var step4L: UIView!
    @IBOutlet weak var step5: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        step1.layer.cornerRadius = 10
        step1L.layer.cornerRadius = 5
        step2.layer.cornerRadius = 10
        step2L.layer.cornerRadius = 5
        step3.layer.cornerRadius = 10
        step3L.layer.cornerRadius = 5
        step4.layer.cornerRadius = 10
        step4L.layer.cornerRadius = 5
        step5.layer.cornerRadius = 10
        
    }

    func setInfo(page: Int) {
        switch page {
        case 2:
            step1.backgroundColor = .C00D9CC()
            step1L.backgroundColor = .C00D9CC()
            step2.setTitleColor(.white, for: .normal)
            step2.backgroundColor = .C0093FF()
            break
        case 3:
            step1.backgroundColor = .C00D9CC()
            step1L.backgroundColor = .C00D9CC()
            step2.backgroundColor = .C00D9CC()
            step2L.backgroundColor = .C00D9CC()
            step3.setTitleColor(.white, for: .normal)
            step3.backgroundColor = .C0093FF()
            break
        case 4:
            step1.backgroundColor = .C00D9CC()
            step1L.backgroundColor = .C00D9CC()
            step2.backgroundColor = .C00D9CC()
            step2L.backgroundColor = .C00D9CC()
            step3.backgroundColor = .C00D9CC()
            step3L.backgroundColor = .C00D9CC()
            step4.setTitleColor(.white, for: .normal)
            step4.backgroundColor = .C0093FF()
            break
        case 5:
            step1.backgroundColor = .C00D9CC()
            step1L.backgroundColor = .C00D9CC()
            step2.backgroundColor = .C00D9CC()
            step2L.backgroundColor = .C00D9CC()
            step3.backgroundColor = .C00D9CC()
            step3L.backgroundColor = .C00D9CC()
            step4.backgroundColor = .C00D9CC()
            step4L.backgroundColor = .C00D9CC()
            step5.setTitleColor(.white, for: .normal)
            step5.backgroundColor = .C0093FF()
            break
        default:
            break
        }
    }

}
