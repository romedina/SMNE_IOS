//
//  ViewControllerMore.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 24/02/21.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FacebookLogin

class ViewControllerMore: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func accountTapped(_ sender: Any) {
    }
    
    @IBAction func collabTapped(_ sender: Any) {
    }
    
    @IBAction func aboutTapped(_ sender: Any) {
    }
    
    @IBAction func privacyTapped(_ sender: Any) {
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        let user = UserDefaults.standard
        if let provider = user.string(forKey: "provider") {
            if provider == "google" {
                GIDSignIn.sharedInstance()?.signOut()
            } else if provider == "facebook" {
                LoginManager().logOut()
            }
        }
        do {
            try Auth.auth().signOut()
            
            user.removeObject(forKey: "name")
            user.removeObject(forKey: "lastName")
            user.removeObject(forKey: "email")
            user.removeObject(forKey: "gender")
            user.removeObject(forKey: "cedula")
            user.removeObject(forKey: "espe")
            user.removeObject(forKey: "school")
            user.removeObject(forKey: "country")
            user.removeObject(forKey: "uId")
            let storyBoard = UIStoryboard(name: "LogIn", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "initial")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        } catch {
            //Se ha producido un error
        }
    }
}
