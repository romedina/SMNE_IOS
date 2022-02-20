//
//  ViewControllerRegister.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import MaterialComponents
import FirebaseAuth
import FirebaseFirestore

protocol RegisterDelegate {
    func infoChanged(id: String, data: String)
    func activeRegisterButton(isActive: Bool)
    func openTerms()
}

class ViewControllerRegister: UIViewController {

    @IBOutlet weak var tableViewRegister: UITableView!
    
    @IBOutlet weak var privacyButton: MDCButton!
    @IBOutlet weak var registerButton: MDCButton!
    
    var name = ""
    var lastName = ""
    var email = ""
    var pass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewRegister.dataSource = self
        tableViewRegister.delegate = self
        privacyButton.setBackgroundColor(.white)
        registerButton.backgroundColor = UIColor.C00D9CC().withAlphaComponent(0.5)
    }

    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if name != "" && lastName != "" && email != "" && pass != "" {
            let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
            nextVC.setAnim(type: .loading)
            let delegate: EndPillAnimationProtocol = nextVC
            nextVC.modalPresentationStyle = .fullScreen
            
            self.present(nextVC, animated: true) {
                Auth.auth().createUser(withEmail: self.email, password: self.pass) { (result, err) in
                    if let err = err {
                        print(err.localizedDescription)
                        if err.localizedDescription == "The email address is already in use by another account." {
                            delegate.endAnimationWith(error: "") {
                                let alert = UIAlertController(title: "Error", message: "El email proporcionado ya esta siendo usado por otra cuenta.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }

                    if let result = result {
                        var info: [String: Any] = [:]
                        info["createdAt"] = Timestamp()
                        info["name"] = self.name
                        info["lastName"] = self.lastName
                        info["email"] = self.email
                        info["updatedAt"] = Timestamp()
                        
                        
                        let db = Firestore.firestore()
                        let docRef = db.collection("doctors").document(result.user.uid)
                        docRef.setData(info) { (err) in
                            if let err = err {
                                print(err.localizedDescription)
                            } else {
                                let user = UserDefaults.standard
                                user.set(self.email, forKey: "email")
                                user.set(self.name, forKey: "name")
                                user.set(self.lastName, forKey: "lastName")
                                user.set(result.user.uid, forKey: "uId")
                                user.synchronize()
                                delegate.endAnimationWith {
                                    self.performSegue(withIdentifier: "login", sender: self)
                                }
                            }
                        }
                    }
                }
            }
            print("Registra")
        } else {
            let alert = UIAlertController(title: "Error", message: "Llena todos los campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension ViewControllerRegister: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellRegister
        cell.delegate = self
        return cell
    }
}

extension ViewControllerRegister: RegisterDelegate {
    func infoChanged(id: String, data: String) {
        switch id {
        case "name":
            self.name = data
            break
        case "lastName":
            self.lastName = data
            break
        case "email":
            self.email = data
            break
        case "pass":
            self.pass = data
            break
        default:
            break
        }
    }
    
    func activeRegisterButton(isActive: Bool) {
        registerButton.backgroundColor = UIColor.C00D9CC().withAlphaComponent(isActive ? 1.0 : 0.5)
        registerButton.isUserInteractionEnabled = isActive
    }
    
    func openTerms() {
        let terms = TermsConditionsViewController()
        terms.modalPresentationStyle = .fullScreen
        self.present(terms, animated: true)
    }
}
