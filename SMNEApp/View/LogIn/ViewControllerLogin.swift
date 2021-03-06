//
//  ViewControllerLogin.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
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
        let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
        let delegate: EndPillAnimationProtocol = nextVC
        nextVC.modalPresentationStyle = .fullScreen
        
        self.present(nextVC, animated: true) {
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (result, err) in
                if let err = err {
                    print(err.localizedDescription)
                    delegate.endAnimationWith(error: "error", completion: { () in
                        let warning = UIAlertController(title: "Error al iniciar sesión", message: "Usuario o clave incorrecta", preferredStyle: .alert)
                        warning.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(warning, animated: true, completion: nil)
                    })
                }
                if let result = result {
                    let user = UserDefaults.standard
                    user.set(self.email, forKey: "email")
                    user.set(result.user.displayName, forKey: "name")
                    user.set(result.user.uid, forKey: "uId")
                    user.synchronize()
                    delegate.endAnimation()
                }
            }
        }
    }
}

extension ViewControllerLogin:  GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
        let delegate: EndPillAnimationProtocol = nextVC
        nextVC.modalPresentationStyle = .fullScreen
        
        if error == nil && user != nil {
            self.present(nextVC, animated: true) {
                let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
                Auth.auth().signIn(with: credential) { (result, err) in
                    if let err = err {
                        print(err.localizedDescription)
                    }
                    if let result = result {
                        
                        let db = Firestore.firestore()
                        let docRef = db.collection("doctors").document(result.user.uid)
                        
                        docRef.getDocument { (doc, err) in
                            if doc == nil {
                                let complete = result.user.displayName?.split(separator: " ")
                                var name = ""
                                var lastName = ""
                                for i in complete! {
                                    if i == complete?.first {
                                        name = String(i)
                                    } else {
                                        lastName.append("\(String(i)) ")
                                    }
                                }
                                var info: [String: Any] = [:]
                                info["createdAt"] = Timestamp()
                                info["name"] = name
                                info["lastName"] = lastName
                                info["email"] = result.user.email
                                info["updatedAt"] = Timestamp()
                                docRef.setData(info) { (err) in
                                    if let err = err {
                                        GIDSignIn.sharedInstance()?.signOut()
                                        print(err.localizedDescription)
                                    } else {
                                        let user = UserDefaults.standard
                                        user.set(self.email, forKey: "email")
                                        user.set(name, forKey: "name")
                                        user.set(result.user.uid, forKey: "uId")
                                        user.set(lastName, forKey: "lastName")
                                        user.synchronize()
                                        delegate.endAnimation()
                                    }
                                }
                            } else {
                                //doc isnt nil
                                let user = UserDefaults.standard
                                if let name = doc?.get("name") as? String {
                                    user.set(name, forKey: "name")
                                }
                                if let email = doc?.get("email") as? String {
                                    user.set(email, forKey: "email")
                                }
                                if let lastName = doc?.get("lastName") as? String {
                                    user.set(lastName, forKey: "lastName")
                                }
                                if let lastName = doc?.get("country") as? String {
                                    user.set(lastName, forKey: "country")
                                }
                                if let lastName = doc?.get("gender") as? String {
                                    user.set(lastName, forKey: "gender")
                                }
                                if let lastName = doc?.get("professionalLicense") as? String {
                                    user.set(lastName, forKey: "cedula")
                                }
                                if let lastName = doc?.get("specialty") as? String {
                                    user.set(lastName, forKey: "espe")
                                }
                                if let lastName = doc?.get("MedicineSchool") as? String {
                                    user.set(lastName, forKey: "school")
                                }
                                
                                user.set(result.user.uid, forKey: "uId")
                                user.synchronize()
                                delegate.endAnimation()
                            }
                        }
                    }
                }
            }
        }
    }
}
