//
//  TableViewControllerNewPatient_S3.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit

protocol OptionSelectedDelegate {
    func optionDelegate(option: Int, ID: String)
    func showWarning(handler: @escaping (_ flag: Bool) -> Void)
}

class TableViewControllerNewPatient_S3: UITableViewController {
    
    let returnButton = SMNEButton()
    var delegate: OptionSelectedDelegate?
    var delegateInfo: InfoChangedDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return step3Cells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = step3Cells[indexPath.row]
        
        if let info = cellInfo as? AlgorithmCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "algorithm", for: indexPath) as! TableViewCellAlgorithmSelection
            cell.setInfo(algorithm: info.title, backColor: info.backColor, textColor: info.textColor, viewController: self, indexP: indexPath.row, ID: info.id)
            cell.delegate = self

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }
}

extension TableViewControllerNewPatient_S3: AlgorithmSelectedDelegate {
    func algorithmSelected(option: Int, ID: String) {
        if let prevId = PatientSelected.shared.patientInfo?.currentTreatment.rawValue {
            if prevId != ID {
                delegate?.showWarning(handler: { (isOk) in
                    if isOk {
                        PatientSelected.shared.prevTreatment = prevId
                        self.delegate?.optionDelegate(option: option, ID: ID)
                        self.delegateInfo?.infoChanged(id: "algorithm", info: ID)
                    }
                })
            } else {
                PatientSelected.shared.prevTreatment = nil
                delegate?.optionDelegate(option: option, ID: ID)
                delegateInfo?.infoChanged(id: "algorithm", info: ID)
            }
        } else {
            delegate?.optionDelegate(option: option, ID: ID)
            delegateInfo?.infoChanged(id: "algorithm", info: ID)
        }
    }
}
