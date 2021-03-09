//
//  ViewControllerPatientList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit
import MaterialComponents
import Firebase

class ViewControllerPatientList: UIViewController {
    
    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var newPatientButton: MDCButton!
    
    @IBOutlet weak var searchPatientInput: UITextField!
    
    var patientsList: [PatientSchema]?
    
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
        
        getData()
    }
    
    func getData() {
        let firebase = FirebaseViewModel()
        firebase.getPatients { (patients) in
            self.patientsList = patients
            self.tableViewList.reloadData()
        }
        
    }
}

extension ViewControllerPatientList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if patientsList != nil {
            return patientsList!.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TableViewCellPatientListTitle
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "patient", for: indexPath) as! TableViewCellPatientList
            if let info = patientsList?[indexPath.row - 1] {
                cell.setInfo(info: info)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "patientInfo", sender: self)
    }
}

extension ViewControllerPatientList: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
