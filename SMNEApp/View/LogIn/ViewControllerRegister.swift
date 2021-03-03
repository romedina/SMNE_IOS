//
//  ViewControllerRegister.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import MaterialComponents
import FirebaseAuth

protocol RegisterDelegate {
    func infoChanged(id: String, data: String)
}

class ViewControllerRegister: UIViewController {

    @IBOutlet weak var tableViewRegister: UITableView!
    
    @IBOutlet weak var privacyButton: MDCButton!
    
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
    }

    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if name != "" && lastName != "" && email != "" && pass != "" {
//            Auth.auth().createUser(withEmail: email, password: pass) { (result, err) in
//                if let err = err {
//                    print(err.localizedDescription)
//                }
//
//                if let result = result {
//                    self.performSegue(withIdentifier: "login", sender: self)
//                }
//            }
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
    
    
}
