//
//  ViewControllerTabBar.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit
import Firebase

class ViewControllerTabBar: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.unselectedItemTintColor = .C00D9CC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let user = UserDefaults.standard
        self.delegate = self
        if let _ = user.string(forKey: "email") {
            let delegate = SingletonForDelegate.shared
            delegate.delegate = self
        } else {
            let storyboard = UIStoryboard(name: "LogIn", bundle: nil)

            let initialViewController = storyboard.instantiateViewController(withIdentifier: "initial")
            initialViewController.modalPresentationStyle = .fullScreen
            self.present(initialViewController, animated: false, completion: nil)
        }
    }
}

extension ViewControllerTabBar: ChangeViewInMainTabDelegate {
    func changeView() {
        if SingletonForDelegate.shared.needToChange {
            self.tabBarController?.selectedIndex = 2
        }
    }
}
