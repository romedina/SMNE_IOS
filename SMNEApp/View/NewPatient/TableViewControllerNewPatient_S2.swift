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
    
    var delegate: InfoChangedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return step2Cells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = step2Cells[indexPath.row]
        
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
            
            cell.setInfo(title: info.title, sub: info.sub, id: info.id)
            cell .delegate = self
            
            return cell
        } else if let _ = cellInfo as? IMCCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imc", for: indexPath) as! TableViewCellIMC
            
            cell.delegate = self
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }
}

extension TableViewControllerNewPatient_S2: CellInfoChangeDelegate {
    func infoChange(id: String, info: Float) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func infoChange(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func infoChange(id: String, info: Bool) {
        delegate?.infoChanged(id: id, info: info)
    }
}
