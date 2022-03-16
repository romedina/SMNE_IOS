//
//  NewForgotPasswordViewController.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/03/22.
//

import UIKit

class NewForgotPasswordViewController: UIViewController {
    
    var emailField: SMNETextField = {
        let view = SMNETextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sendButton : SMNEButton = {
        let view = SMNEButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addViews() {
        view.addSubview(emailField)
        view.addSubview(sendButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    

}
