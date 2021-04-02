//
//  AlertsView.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 16/03/21.
//

import UIKit

class AlertsView: UIView {

    @IBOutlet weak var parentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInfo() {
        parentView.layer.cornerRadius = 21
    }
    
    class func instanceFromNib() -> UIView {
        let vc = UINib(nibName: "AlertsView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! AlertsView
        vc.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return vc
    }

}
