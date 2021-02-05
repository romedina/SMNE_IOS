//
//  ViewControllerPatientList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit

class ViewControllerPatientList: UIViewController {
    
    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var newPatientButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newPatientButton.layer.cornerRadius = 27
        
        tableViewList.delegate = self
        tableViewList.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
