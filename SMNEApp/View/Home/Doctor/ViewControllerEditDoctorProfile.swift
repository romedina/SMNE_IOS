//
//  ViewControllerEditDoctorProfile.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/02/21.
//

import UIKit

class ViewControllerEditDoctorProfile: UIViewController {

    @IBOutlet weak var doctorInfoTable: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        doctorInfoTable.delegate = self
        doctorInfoTable.dataSource = self
        
        saveButton.layer.cornerRadius = 8
        
    }
    
    @IBAction func returnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
    }
}

extension ViewControllerEditDoctorProfile: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = doctorInfoTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellEditDoctorInfo
        
        return cell
    }
    
    
}
