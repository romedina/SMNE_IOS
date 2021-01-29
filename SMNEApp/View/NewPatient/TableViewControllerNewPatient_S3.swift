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
        return 5
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "algorithm", for: indexPath) as! TableViewCellAlgorithmSelection

            // Configure the cell...
            cell.setInfo(algorithm: "Algoritmo de tratamiento de la DM2 con enfermedad renal crónica (ERC)", backColor: .C1(), textColor: .white, viewController: self)

            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "algorithm", for: indexPath) as! TableViewCellAlgorithmSelection

            // Configure the cell...
            cell.setInfo(algorithm: "Algortimo en DM2 con insuficiencia cardiaca IM/ACV", backColor: .C2(), textColor: .C3(), viewController: self)

            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            // Configure the cell...

            return cell
        }
    }
    
    func algorithmSelected() {
        // Enviar cambio al pageView para pasar de página
    }
    
}
