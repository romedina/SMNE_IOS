//
//  ViewControllerAlert.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 15/03/21.
//

import UIKit

class ViewControllerAlert: UIViewController {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    enum AlertType {
        case Success
        case Error
        case Warning
    }
    
    func setInfo(type: AlertType) {
        switch type {
        case .Success:
            break
        case .Error:
            break
        case .Warning:
            break
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
    }
    
}
