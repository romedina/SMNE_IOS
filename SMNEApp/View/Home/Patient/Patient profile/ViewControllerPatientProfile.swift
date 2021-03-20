//
//  ViewControllerPatientProfile.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 28/02/21.
//

import UIKit

protocol NewRevitionDelegate {
    func newRevition()
}

class ViewControllerPatientProfile: UIViewController {
    
    @IBOutlet weak var patientIdLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var tableViewEvaluations: UITableView!
    @IBOutlet weak var iconView: UIView!
    
    var patientId: String?
    
    let patientInfo = PatientSelected.shared.patientInfo
    var evaluations = PatientSelected.shared.patientInfo?.evaluations.count
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewEvaluations.delegate = self
        tableViewEvaluations.dataSource = self
        
        let str = patientInfo?.pId ?? ""
        let index = str.index(str.startIndex, offsetBy: 8)
        let mySubstring = str[..<index] // Hello
        patientIdLabel.text = "\(String(mySubstring))..."
        iconView.layer.cornerRadius = 23
        profileButton.layer.cornerRadius = 10
    }
    
    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        evaluations = PatientSelected.shared.patientInfo?.evaluations.count
//        self.tableViewEvaluations.reloadData()
//    }
    
}

extension ViewControllerPatientProfile: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (evaluations ?? 1) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "new") as! TableViewCellNewRevition
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "revition") as! TableViewCellRevition
            
            return cell
        }
    }
}

extension ViewControllerPatientProfile: NewRevitionDelegate {
    func newRevition() {
        self.performSegue(withIdentifier: "newPatient", sender: self)
    }
}
