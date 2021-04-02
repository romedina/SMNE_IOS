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
    @IBOutlet weak var searchPatientView: UIView!
    
    @IBOutlet weak var searchPatientInput: UITextField!
    
    var patientsList: [PatientSchema]?
    var patientFiltered: [PatientSchema]?
    
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
        
        searchPatientView.layer.cornerRadius = 8
        
        getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    func getData() {
        let firebase = FirebaseViewModel()
        firebase.getPatients { (patients) in
            self.patientsList = patients
            self.tableViewList.reloadData()
        }
    }
    
    @IBAction func newPatientTapped(_ sender: Any) {
//        let storyBoard = UIStoryboard(name: "NewPatient", bundle: nil)
//        let nextVC = storyBoard.instantiateViewController(withIdentifier: "init")
//        self.navigationController?.pushViewController(nextVC, animated: true)
        PatientSelected.shared.patientInfo = nil
    }
    
    @IBAction func searchPatientChanged(_ sender: UITextField) {
        guard let pList = patientsList else { return }
        guard let filter = sender.text else { return }
        if filter == "" {
            patientFiltered = nil
            tableViewList.reloadData()
            return
        }
        patientFiltered = []
        for patient in pList {
            if let _ = patient.name.range(of: filter, options: .caseInsensitive) {
                patientFiltered?.append(patient)
            } else {
                if let _ = patient.pId.range(of: filter, options: .caseInsensitive) {
                    patientFiltered?.append(patient)
                }
            }
//            if patient.name.contains(filter) || patient.pId.contains(filter) {
//                patientFiltered?.append(patient)
//            }
        }
        tableViewList.reloadData()
    }
}

extension ViewControllerPatientList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if patientFiltered != nil {
            return patientFiltered!.count + 1
        } else if patientsList != nil {
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
            if patientFiltered != nil {
                let cell = tableView.dequeueReusableCell(withIdentifier: "patient", for: indexPath) as! TableViewCellPatientList
                if let info = patientFiltered?[indexPath.row - 1] {
                    cell.setInfo(info: info)
                }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "patient", for: indexPath) as! TableViewCellPatientList
                if let info = patientsList?[indexPath.row - 1] {
                    cell.setInfo(info: info)
                }
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if patientFiltered != nil {
            PatientSelected.shared.patientInfo = patientFiltered?[indexPath.row - 1]
        } else {
            PatientSelected.shared.patientInfo = patientsList?[indexPath.row - 1]
        }
        self.performSegue(withIdentifier: "patientInfo", sender: self)
    }
}

extension ViewControllerPatientList: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
