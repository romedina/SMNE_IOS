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
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var floatingButton: UIButton!
    
    var patientId: String?
    
    let patientInfo = PatientSelected.shared.patientInfo
    var evaluations = PatientSelected.shared.patientInfo?.evaluations
    
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
        
        pageTitle.text = "\(patientInfo?.name ?? "") \(patientInfo?.lastName ?? "")"
        evaluations?.reverse()
        floatingButton.layer.cornerRadius = 27
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if PatientSelected.shared.hasChanged {
            PatientSelected.shared.hasChanged = false
            evaluations = PatientSelected.shared.patientInfo?.evaluations
            evaluations?.reverse()
            tableViewEvaluations.reloadData()
        }
    }
    
    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        evaluations = PatientSelected.shared.patientInfo?.evaluations.count
//        self.tableViewEvaluations.reloadData()
//    }
    
    @IBAction func floatingTapped(_ sender: Any) {
        let floatingMenu = FloatingMenu(nibName: "FloatingMenu", bundle: nil)
        floatingMenu.modalPresentationStyle = .overFullScreen
        floatingMenu.delegate = self
        self.present(floatingMenu, animated: true, completion: nil)
    }
    
}

extension ViewControllerPatientProfile: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (evaluations?.count ?? 1) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "new") as! TableViewCellNewRevition
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "revition") as! TableViewCellRevition
            cell.delegate = self
            if let info = evaluations?[indexPath.row - 1] {
                if info.dose == evaluations!.first?.dose {
                    cell.setInfo(info: info, isLAst: true)
                } else {
                    cell.setInfo(info: info, isLAst: false)
                }
            }
            return cell
        }
    }
}

extension ViewControllerPatientProfile: NewRevitionDelegate {
    func newRevition() {
        self.performSegue(withIdentifier: "newPatient", sender: self)
    }
}

extension ViewControllerPatientProfile: ListToControllerDelegate {
    func listToController(date: String, comment: String) {
        PopCommentView.show(date: date, message: comment, controller: self) { }
    }
}

extension ViewControllerPatientProfile: FloatingMenuDelegate {
    func goToNextEv() {
        self.performSegue(withIdentifier: "newPatient", sender: self)
    }
    
    func goToNewRev() {
        self.performSegue(withIdentifier: "newRevition", sender: self)
    }
    
    func goToFEv() {
        self.performSegue(withIdentifier: "newPatient", sender: self)
        PatientSelected.shared.isFromFirst = true
    }
}
