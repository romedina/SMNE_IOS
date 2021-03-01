//
//  ViewControllerPatientList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit
import MaterialComponents

class ViewControllerPatientList: UIViewController {
    
    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var newPatientButton: MDCButton!
    
    @IBOutlet weak var searchPatientInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newPatientButton.layer.cornerRadius = 27
        
        searchPatientInput.backgroundColor = .clear
        searchPatientInput.borderStyle = .none
        searchPatientInput.textColor = .C052D6C()
        
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        searchPatientInput.delegate = self
    }
}

extension ViewControllerPatientList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TableViewCellPatientListTitle
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "patient", for: indexPath) as! TableViewCellPatientList

            return cell
        }
    }
}

extension ViewControllerPatientList: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
