//
//  TableViewControllerNewPatient_S4.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton

protocol Step4Delegate {
    func needReload()
}

class TableViewControllerNewPatient_S4: UITableViewController {
    
    public enum StepFourValues {
        case hba1c
        case glucose
        case filter
        case deterioration
    }
    
    let nextButton = MDCButton()
    let returnButton = MDCButton()
    let buttonsStack = UIStackView()
    
    var delegate: InfoChangedDelegate?
    var needsReload = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if needsReload {
            tableView.reloadData()
            needsReload = false
        }
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
            cell.delegate?.infoChange(id: "filter", info: "<15")
            cell.op1Button.setImage(#imageLiteral(resourceName: "radioS"), for: .normal)
            cell.op2Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
            cell.op3Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
            cell.op4Button.setImage(#imageLiteral(resourceName: "radioNS"), for: .normal)
            cell.isUserInteractionEnabled = false
            return cell
        } else if let _ = cellInfo as? DeteriorationCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "deterioration", for: indexPath) as! TableViewCellDeterioration
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }
    
    public func setErrorTo(value: StepFourValues, mensaje: String) {
        switch value {
        case .hba1c:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCellOpenOpen else { return }
            cell.input1Controller?.setErrorText(mensaje, errorAccessibilityValue: nil)
            cell.input1Controller?.errorColor = .red
            break
        case .glucose:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCellOpenOpen else { return }
            cell.input2Controller?.setErrorText(mensaje, errorAccessibilityValue: nil)
            cell.input2Controller?.errorColor = .red
            break
        case .filter:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TableViewCellMultiRadio else { return }
            cell.op1View.layer.borderColor = UIColor.red.cgColor
            cell.op2View.layer.borderColor = UIColor.red.cgColor
            cell.op3View.layer.borderColor = UIColor.red.cgColor
            cell.op4View.layer.borderColor = UIColor.red.cgColor
            break
        case .deterioration:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCellDeterioration else { return }
            break
        }
    }

}

extension TableViewControllerNewPatient_S4: CellInfoChangeDelegate, Step4Delegate {
    func needReload() {
        needsReload = true
    }
    
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
