//
//  TableViewControllerNewPatient_S2.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton

protocol MainToS2Delegate {
    func changeERC(hasERC: Bool)
    func changeHipo(filt: Float)
}

protocol OpenFromLabelDelegate {
    func openModal()
}

class TableViewControllerNewPatient_S2: UITableViewController, MainToS2Delegate {
    
    public enum StepTwoValues {
        case weight
        case height
        case levels
        case renal
        case erc
        case hipo
    }
    
    let nextButton = MDCButton()
    let returnButton = MDCButton()
    let buttonsStack = UIStackView()
    
    var delegate: InfoChangedDelegate?
    
    var subToCell: SubToCellDelegate?
    var subToCellHipo: SubToCellDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return step2Cells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("=====Aquí")
        
        let cellInfo = step2Cells[indexPath.row]
        if let info = cellInfo as? OpenCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "open", for: indexPath) as! TableViewCellOpen
            
            cell.setInfo(title: info.title, placeHolder: info.placeHolder)

            return cell
        } else if let info = cellInfo as? BoolCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bool", for: indexPath) as! TableViewCellBool
            
            cell.setInfo(title: info.title, sub: info.sub, id: info.id)
            cell.delegate = self
            cell.openModalDelegate = self
            
            if info.id == "renal" {
                subToCell = cell
            }
            
            if info.id == "hipo" {
                subToCellHipo = cell
            }
            
            if info.id != "cardio" {
                cell.disableButtons()
            }
            
            return cell
        } else if let _ = cellInfo as? IMCCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imc", for: indexPath) as! TableViewCellIMC
            
            cell.delegate = self
            if PatientSelected.shared.patientInfo != nil {
                cell.setValues(height: PatientSelected.shared.patientInfo?.evaluations.last?.height ?? 0.0, weight: PatientSelected.shared.patientInfo?.evaluations.last?.weight ?? 0.0, levels: PatientSelected.shared.patientInfo?.evaluations.last?.creatinineLevels ?? 0.0,  imc:PatientSelected.shared.patientInfo?.evaluations.last?.imc ?? 0.0)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }
    
    func changeERC(hasERC: Bool) {
        print("=====Si cambia jajaja saludos")
        subToCell?.changeERC(hasERC)
    }
    
    func changeHipo(filt: Float) {
        if filt < 15 {
            delegate?.infoChanged(id: "filter", info: "<15")
        } else if filt < 30 {
            delegate?.infoChanged(id: "filter", info: "15-29")
        }
        else if filt < 45 {
           delegate?.infoChanged(id: "filter", info: "30-44")
       } else {
           delegate?.infoChanged(id: "filter", info: "45-59")
       }
        let userD = UserDefaults.standard
        let isOlder = userD.bool(forKey: "older")
        subToCellHipo?.changeHipo(filt < 60 || isOlder)
    }
    
    public func setErrorTo(value: StepTwoValues, mensaje: String) {
        switch value {
        case .weight:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCellIMC else { return }
            cell.weightTextInput.setErrorWith(text: mensaje)
            break
        case .height:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCellIMC else { return }
            cell.heightTextInput.setErrorWith(text: mensaje)
        case .levels:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCellIMC else { return }
            cell.levelstextInput.setErrorWith(text: mensaje)
        case .renal:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TableViewCellBool else { return }
            cell.yesButton.setBorderColor(.red, for: .normal)
            cell.noButton.setBorderColor(.red, for: .normal)
        case .erc:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TableViewCellBool else { return }
            cell.yesButton.setBorderColor(.red, for: .normal)
            cell.noButton.setBorderColor(.red, for: .normal)
        case .hipo:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? TableViewCellBool else { return }
            cell.yesButton.setBorderColor(.red, for: .normal)
            cell.noButton.setBorderColor(.red, for: .normal)
        }
    }
}

extension TableViewControllerNewPatient_S2: CellInfoChangeDelegate, OpenFromLabelDelegate {
    func infoChange(id: String, info: Float) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func infoChange(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func infoChange(id: String, info: Bool) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func openModal() {
        let view = CriteriaModalViewController()
        view.modalPresentationStyle = .overFullScreen
        self.present(view, animated: true)
    }
}
