//
//  TableViewControllerNewPatient_S2.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton

class TableViewControllerNewPatient_S2: UITableViewController {
    
    let nextButton = MDCButton()
    let returnButton = MDCButton()
    let buttonsStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stepTwo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = stepTwo[indexPath.row]
        
        if let info = cellInfo as? TitleCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TableViewCellTitle

            cell.setInfo(title: info.title, subtitle: info.subtitle)

            return cell
        } else if let info = cellInfo as? StepperCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "stepper", for: indexPath) as! TableViewCellStepper

            cell.setInfo(page: info.page)

            return cell
        } else if let info = cellInfo as? OpenCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "open", for: indexPath) as! TableViewCellOpen
            
            cell.setInfo(title: info.title, placeHolder: info.placeHolder)

            return cell
        } else if let info = cellInfo as? BoolCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bool", for: indexPath) as! TableViewCellBool
            
            cell.setInfo(title: info.title, sub: info.sub)
            
            return cell
        } else if let _ = cellInfo as? IMCCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imc", for: indexPath) as! TableViewCellIMC
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }
}
