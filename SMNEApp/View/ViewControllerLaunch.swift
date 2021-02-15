//
//  ViewControllerLaunch.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 14/02/21.
//

import UIKit

class ViewControllerLaunch: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let colors: [CGColor] = [UIColor.C052D6C().cgColor, UIColor(red: 56, green: 83, blue: 170, alpha: 1).cgColor]
        let gl: CAGradientLayer = CAGradientLayer()
        gl.colors = colors
        gl.locations = [0.0, 1.0]
        
        view.backgroundColor = UIColor.clear
        gl.frame = view.frame
        view.layer.insertSublayer(gl, at: 0)
    }
}
