//
//  ViewControllerLogin.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var tableViewLogin: UITableView!
    @IBOutlet weak var returnButton: UIButton!
    
    var email = ""
    var pass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewLogin.delegate = self
        tableViewLogin.dataSource = self
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
    }

    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViewControllerLogin: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellLogin
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.layer.bounds.height - 150
    }
    
}

extension ViewControllerLogin: LoginCellDelegate {
    func otherLogin(type: TableViewCellLogin.LoginType) {
        switch type {
        case .apple:
            break
        case .google:
            GIDSignIn.sharedInstance()?.signOut()
            GIDSignIn.sharedInstance()?.signIn()
            break
        default:
            break
        }
    }
    
    func infoChanged(email: String, pass: String) {
        self.email = email
        self.pass = pass
    }
    
    func loginTapped() {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
            }
            if let result = result {
                let user = UserDefaults.standard
                user.set(self.email, forKey: "email")
                user.set(result.user.displayName, forKey: "name")
                user.set(result.user.uid, forKey: "uId")
                user.synchronize()
                self.performSegue(withIdentifier: "login", sender: self)
            }
        }
    }
}

extension ViewControllerLogin:  GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil && user != nil {
            let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
            Auth.auth().signIn(with: credential) { (result, err) in
                if let err = err {
                    print(err.localizedDescription)
                }
                if let result = result {
                    let user = UserDefaults.standard
                    user.set(self.email, forKey: "email")
                    user.set(result.user.displayName, forKey: "name")
                    user.set(result.user.uid, forKey: "uId")
                    user.set("google", forKey: "provider")
                    user.synchronize()
                    self.performSegue(withIdentifier: "login", sender: self)
                }
            }
        }
    }
}
