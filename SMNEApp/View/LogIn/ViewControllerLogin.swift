//
//  ViewControllerLogin.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var tableViewLogin: UITableView!
    @IBOutlet weak var returnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewLogin.delegate = self
        tableViewLogin.dataSource = self
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
    func loginTapped() {
        self.performSegue(withIdentifier: "login", sender: self)
    }
}
