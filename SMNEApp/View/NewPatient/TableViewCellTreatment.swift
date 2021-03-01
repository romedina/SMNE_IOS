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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 10
    }
    
    func prepareForInit() {
        tl2.isHidden = true
        stl2.isHidden = true
        tl3.isHidden = true
        stl3.isHidden = true
        tl4.isHidden = true
        stl4.isHidden = true
        tl5.isHidden = true
        stl5.isHidden = true
        tl6.isHidden = true
        stl6.isHidden = true
        tl7.isHidden = true
        stl7.isHidden = true
        
    }
    
    func setInfo(options: Option) {
        prepareForInit()
        for i in 0..<options.treatments.count {
            print("i: \(i)")
            let title = options.treatments[i].title
            let subTitle = options.treatments[i].subtitle
            print("\(title): \(subTitle)")
            
            switch i {
            case 0:
                titleLabel.text = options.treatments[i].title
                subTitleLabel.text = options.treatments[i].subtitle
                break
            case 1:
                if options.treatments[i].title != "" {
                    tl2.isHidden = false
                    if options.treatments[i].subtitle != "" {
                        stl2.isHidden = false
                    } else {
                        stl2.isHidden = true
                    }
                } else {
                    tl2.isHidden = true
                    break
                }
                tl2.text = title
                stl2.text = subTitle
                break
            case 2:
                if options.treatments[i].title != "" {
                    tl3.isHidden = false
                    if options.treatments[i].subtitle != "" {
                        stl3.isHidden = false
                    } else {
                        stl3.isHidden = true
                    }
                } else {
                    tl3.isHidden = true
                    break
                }
                tl3.text = title
                stl3.text = subTitle
                break
            case 3:
                if options.treatments[i].title != "" {
                    tl4.isHidden = false
                    if options.treatments[i].subtitle != "" {
                        stl4.isHidden = false
                    } else {
                        stl4.isHidden = true
                    }
                } else {
                    tl4.isHidden = true
                    break
                }
                tl4.text = title
                stl4.text = subTitle
                break
            case 4:
                if options.treatments[i].title != "" {
                    tl5.isHidden = false
                    if options.treatments[i].subtitle != "" {
                        stl5.isHidden = false
                    } else {
                        stl5.isHidden = true
                    }
                } else {
                    tl5.isHidden = true
                    break
                }
                tl5.text = title
                stl5.text = subTitle
                break
            case 5:
                if options.treatments[i].title != "" {
                    tl6.isHidden = false
                    if options.treatments[i].subtitle != "" {
                        stl6.isHidden = false
                    } else {
                        stl6.isHidden = true
                    }
                } else {
                    tl6.isHidden = true
                    break
                }
                tl6.text = options.treatments[i].title
                stl6.text = subTitle
                break
            case 6:
                if options.treatments[i].title != "" {
                    tl7.isHidden = false
                    if options.treatments[i].subtitle != "" {
                        stl7.isHidden = false
                    } else {
                        stl7.isHidden = true
                    }
                } else {
                    tl7.isHidden = true
                    break
                }
                tl7.text = title
                stl7.text = subTitle
                break
            default:
                break
            }
        }
    }

}
