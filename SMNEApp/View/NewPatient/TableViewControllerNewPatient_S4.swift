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
    
    var delegate: InfoChangedDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return step4Cells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = step4Cells[indexPath.row]
        
        if let info = cellInfo as? OpenOpenCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "openopen", for: indexPath) as! TableViewCellOpenOpen
            
            cell.setInfo(t1: info.title1, t2: info.title2, tr1: info.trailing1, tr2: info.trailing2, id1: "hba1c", id2: "glucose")
            cell.delegate = self
            
            if PatientSelected.shared.patientInfo != nil {
                cell.setValues(v1: "\(PatientSelected.shared.patientInfo?.evaluations.last?.glycosylatedHemoglobin ?? 0.0)", v2: "\(PatientSelected.shared.patientInfo?.evaluations.last?.fastingGlucose ?? 0.0)")
            }

            return cell
        } else if let _ = cellInfo as? CommentCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "comment", for: indexPath) as! TableViewCellComment
            cell.delegate = self
            return cell
        } else if let _ = cellInfo as? MultiRadioCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "radio", for: indexPath) as! TableViewCellMultiRadio
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }

}

extension TableViewControllerNewPatient_S4: CellInfoChangeDelegate {
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
