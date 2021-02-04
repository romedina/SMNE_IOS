//
//  TableViewControllerNewPatient_S3.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton

class TableViewControllerNewPatient_S3: UITableViewController {
    
    let returnButton = MDCButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stepThree.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = stepThree[indexPath.row]
        
        if let info = cellInfo as? TitleCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TableViewCellTitle

            cell.setInfo(title: info.title, subtitle: info.subtitle)

            return cell
        } else if let info = cellInfo as? StepperCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "stepper", for: indexPath) as! TableViewCellStepper

            cell.setInfo(page: info.page)

            return cell
        } else if let info = cellInfo as? AlgorithmCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "algorithm", for: indexPath) as! TableViewCellAlgorithmSelection
            
            cell.setInfo(algorithm: info.title, backColor: info.backColor, textColor: info.textColor, viewController: self)

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }
    
    func algorithmSelected() {
        // Enviar cambio al pageView para pasar de página
    }
    
}
