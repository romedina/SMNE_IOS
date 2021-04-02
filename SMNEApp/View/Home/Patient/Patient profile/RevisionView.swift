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
    @IBOutlet weak var parentView: UIView!
    
    var index: Int?
    var titleS = ""
    var subtitleS = ""
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        parentView.layer.cornerRadius = 10
        parentView.layer.borderWidth = 1
        parentView.layer.borderColor = UIColor(red: 192/255, green: 238/255, blue: 242/255, alpha: 1).cgColor
        titleLabel.text = titleS
        subLabel.text = subtitleS
    }
    
    func setInfo(index: Int, title: String, sub: String) {
        titleS = title
        subtitleS = sub
        self.index = index
    }

    @IBAction func revitionTapped(_ sender: Any) {
        print(index ?? 0)
    }
}
