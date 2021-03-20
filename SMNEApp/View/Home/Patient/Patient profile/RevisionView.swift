//
//  Revisiones.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 19/03/21.
//

import UIKit

class RevisionView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    var index: Int?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = 10
    }
    
    func setInfo(index: Int, title: String, sub: String) {
        titleLabel.text = title
        subLabel.text = sub
        self.index = index
    }

    @IBAction func revitionTapped(_ sender: Any) {
        print(index)
    }
}
