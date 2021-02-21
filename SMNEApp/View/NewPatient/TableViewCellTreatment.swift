//
//  TableViewCellTreatment.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit

class TableViewCellTreatment: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    @IBOutlet weak var tl2: UILabel!
    @IBOutlet weak var stl2: UILabel!
    @IBOutlet weak var tl3: UILabel!
    @IBOutlet weak var stl3: UILabel!
    @IBOutlet weak var tl4: UILabel!
    @IBOutlet weak var stl4: UILabel!
    @IBOutlet weak var tl5: UILabel!
    @IBOutlet weak var stl5: UILabel!
    @IBOutlet weak var tl6: UILabel!
    @IBOutlet weak var stl6: UILabel!
    @IBOutlet weak var tl7: UILabel!
    @IBOutlet weak var stl7: UILabel!
    
    @IBOutlet weak var op2: UIView!
    @IBOutlet weak var op3: UIView!
    @IBOutlet weak var op4: UIView!
    @IBOutlet weak var op5: UIView!
    @IBOutlet weak var op6: UIView!
    @IBOutlet weak var op7: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 10
    }
    
    func prepareForInit() {
        op2.isHidden = true
        op3.isHidden = true
        op4.isHidden = true
        op5.isHidden = true
        op6.isHidden = true
        op7.isHidden = true
        
    }
    
    func setInfo(options: Option) {
        prepareForInit()
        for i in 0..<options.treatments.count {
            print("i: \(i)")
            print(options.treatments[i])
            switch i {
            case 0:
                titleLabel.text = options.treatments[i].title
                subTitleLabel.text = options.treatments[i].subtitle
                break
            case 1:
                if options.treatments[i].title != "" {
                    op2.isHidden = false
                } else {
                    op2.isHidden = true
                    break
                }
                tl2.text = options.treatments[i].title
                stl2.text = options.treatments[i].subtitle
                break
            case 2:
                if options.treatments[i].title != "" {
                    op3.isHidden = false
                } else {
                    op3.isHidden = true
                    break
                }
                tl3.text = options.treatments[i].title
                stl3.text = options.treatments[i].subtitle
                break
            case 3:
                if options.treatments[i].title != "" {
                    op4.isHidden = false
                } else {
                    op4.isHidden = true
                    break
                }
                tl4.text = options.treatments[i].title
                stl4.text = options.treatments[i].subtitle
                break
            case 4:
                if options.treatments[i].title != "" {
                    op5.isHidden = false
                } else {
                    op5.isHidden = true
                    break
                }
                tl5.text = options.treatments[i].title
                stl5.text = options.treatments[i].subtitle
                break
            case 5:
                if options.treatments[i].title != "" {
                    op6.isHidden = false
                } else {
                    op6.isHidden = true
                    break
                }
                tl6.text = options.treatments[i].title
                stl6.text = options.treatments[i].subtitle
                break
            case 6:
                if options.treatments[i].title != "" {
                    op7.isHidden = false
                } else {
                    op7.isHidden = true
                    break
                }
                tl7.text = options.treatments[i].title
                stl7.text = options.treatments[i].subtitle
                break
            default:
                break
            }
        }
    }

}
