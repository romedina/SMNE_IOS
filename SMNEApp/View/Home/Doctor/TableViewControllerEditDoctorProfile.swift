//
//  TableViewControllerEditDoctorProfile.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 03/03/21.
//

import UIKit

class TableViewControllerEditDoctorProfiles: UITableViewController {

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellEditDoctorInfo
        
        return cell
    }
}
