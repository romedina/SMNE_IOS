//
//  ViewControllerPatienInfoEdit.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 28/02/21.
//

import UIKit
import MaterialComponents

class ViewControllerPatienInfoEdit: UIViewController {
    
    @IBOutlet weak var idPatientLabel: UILabel!
    @IBOutlet weak var patientInfoTable: UITableView!
    @IBOutlet weak var returnButton: MDCButton!
    @IBOutlet weak var saveButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        patientInfoTable.dataSource = self
        patientInfoTable.delegate = self
        returnButton.setBorderColor(.C00D9CC(), for: .normal)
        returnButton.setBorderWidth(1.0, for: .normal)
    }
    
    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ViewControllerPatienInfoEdit: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! TableViewCellPatientEditProfile
        
        return cell
    }
    
    
}
