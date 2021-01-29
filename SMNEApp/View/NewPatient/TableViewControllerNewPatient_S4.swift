//
//  TableViewControllerNewPatient_S4.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton

class TableViewControllerNewPatient_S4: UITableViewController {
    
    let nextButton = MDCButton()
    let returnButton = MDCButton()
    let buttonsStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TableViewCellTitle

            // Configure the cell...

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "stepper", for: indexPath) as! TableViewCellStepper

            // Configure the cell...

            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "slider", for: indexPath) as! TableViewCellSlider

            // Configure the cell...

            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "slider", for: indexPath) as! TableViewCellSlider

            // Configure the cell...

            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "comment", for: indexPath) as! TableViewCellComment

            // Configure the cell...

            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            // Configure the cell...

            return cell
        }
        
    }

}
