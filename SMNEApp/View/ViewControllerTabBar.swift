//
//  ViewControllerTabBar.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit
import Firebase

class ViewControllerTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.unselectedItemTintColor = .C00D9CC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let user = UserDefaults.standard
        if let email = user.string(forKey: "email") {
            
        } else {
            let storyboard = UIStoryboard(name: "LogIn", bundle: nil)

            let initialViewController = storyboard.instantiateViewController(withIdentifier: "initial")
            initialViewController.modalPresentationStyle = .fullScreen
            self.present(initialViewController, animated: false, completion: nil)
        }
    }
}
