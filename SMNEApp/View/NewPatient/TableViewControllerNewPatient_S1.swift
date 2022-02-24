//
//  TableViewControllerNewPatient_S1.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit

protocol InfoChangedDelegate {
    func infoChanged(id: String, info: Any)
}

class TableViewControllerNewPatient_S1: UITableViewController {
    
    public enum StepOneValues {
        case name
        case lastName
        case type
        case gender
        case age
        case ascendant
        case diabetesYear
    }
    
    let nextButton = SMNEButton()
    let returnButton = SMNEButton()
    let buttonsStack = UIStackView()
    
    var patientId = ""
    
    var delegate: InfoChangedDelegate?
    
    override func viewDidAppear(_ animated: Bool) {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .C00D9CC()
        nextButton.setTitle("Siguiente", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        
        returnButton.layer.cornerRadius = 5
        returnButton.setBackgroundColor(.white)
        returnButton.setBorderWidth(1, for: .normal)
        returnButton.setBorderColor(.C00D9CC(), for: .normal)
        returnButton.setTitleColor(.C00D9CC(), for: .normal)
        returnButton.setTitle("Regresar", for: .normal)
        
        buttonsStack.alignment = .fill
        buttonsStack.distribution = .fillEqually
        buttonsStack.spacing = 10
        buttonsStack.axis = .horizontal
        
        buttonsStack.addArrangedSubview(returnButton)
        buttonsStack.addArrangedSubview(nextButton)
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        self.navigationController?.view.addSubview(buttonsStack)
        if let navCon = self.navigationController {
            buttonsStack.bottomAnchor.constraint(equalTo: navCon.view.bottomAnchor, constant: -20).isActive = true
            buttonsStack.leadingAnchor.constraint(equalTo: navCon.view.leadingAnchor, constant: 18).isActive = true
            buttonsStack.trailingAnchor.constraint(equalTo: navCon.view.trailingAnchor, constant: -18).isActive = true
            buttonsStack.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return step1Cells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellInfo = step1Cells[indexPath.row]
        
        if let info = cellInfo as? OpenCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "open", for: indexPath) as! TableViewCellOpen
            
            cell.setInfo(title: info.title, placeHolder: info.placeHolder)
            cell.delegate = self

            return cell
        } else if let _ = cellInfo as? RadioRadioCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "radio,radio", for: indexPath) as! TableViewCellRadioRadio
            if PatientSelected.shared.patientInfo != nil {
                cell.setValues(v1: PatientSelected.shared.patientInfo?.consultationType ?? ConsultationEnum.privada, v2: PatientSelected.shared.patientInfo?.gender ?? GenderEnum.fem)
            }
            
            cell.delegate = self
            
            return cell
        } else if let info = cellInfo as? ListCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! TableViewCellList
            
            cell.setInfo(title: info.title, options: info.options)
            cell.delegate = self
            
            return cell
        } else if let _ = cellInfo as? InfoCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoPatient", for: indexPath) as! TableViewCellInfoPatient
            cell.setInfo(patientId: self.patientId)
            return cell
        } else if let _ = cellInfo as? RadioCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "radio", for: indexPath) as! TableViewCellRadioButton
            cell.delegate = self
            if let racial = PatientSelected.shared.patientInfo?.racialAncestry {
                cell.setValues(v1: racial)
            }
            return cell
        }  else if let info = cellInfo as? OpenOpenCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "openopen") as! TableViewCellOpenOpen
            cell.setInfo(t1: info.title1, t2: info.title2, tr1: info.trailing1, tr2: info.trailing2, id1: "name", id2: "lastName")
            if PatientSelected.shared.patientInfo != nil {
                cell.setValues(v1: PatientSelected.shared.patientInfo?.name ?? "", v2: PatientSelected.shared.patientInfo?.lastName ?? "")
            }
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
        
    }
    
    public func setErrorTo(value: StepOneValues, mensaje: String) {
        switch value {
        case .name:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TableViewCellOpenOpen else { return }
            cell.open1Input.setErrorWith(text: mensaje)
            print("Nombre")
            break
        case .lastName:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TableViewCellOpenOpen else { return }
            cell.open2Input.setErrorWith(text: mensaje)
            print("Apellido")
            break
        case .type:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TableViewCellRadioRadio else { return }
            print("Tipo")
            cell.typeView.layer.borderColor = UIColor.red.cgColor
            break
        case .gender:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TableViewCellRadioRadio else { return }
            print("Genero")
            cell.genderView.layer.borderColor = UIColor.red.cgColor
            break
        case .age:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? TableViewCellOpen else { return }
            print("Edad")
            cell.openInput.setErrorWith(text: mensaje)
            break
        case .ascendant:
            break
        case .diabetesYear:
            guard let cell = tableView.cellForRow(at: IndexPath(row: 5, section: 0)) as? TableViewCellOpen else { return }
            print("Año diabetes")
            cell.openInput.setErrorWith(text: mensaje)
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 150
        }
        return tableView.rowHeight
    }
    
    @objc func nextButtonTapped(_ sender: SMNEButton) {
        if let navCon = self.navigationController {
            let viewController = navCon.topViewController
            if let _ = viewController as? TableViewControllerNewPatient_S1 {
                self.performSegue(withIdentifier: "s1s2", sender: self)
            } else if let _ = viewController as? TableViewControllerNewPatient_S2 {
                self.performSegue(withIdentifier: "s2s3", sender: self)
            }
            else if let _ = viewController as? TableViewControllerNewPatient_S3 {
                //self.performSegue(withIdentifier: "s3s4", sender: self)
            }
            else if let _ = viewController as? TableViewControllerNewPatient_S4 {
                self.performSegue(withIdentifier: "s4s5", sender: self)
            }
            else if let _ = viewController as? TableViewControllerNewPatient_S5 {
                //self.performSegue(withIdentifier: "s1s2", sender: self)
            }
            
        }
    }
    
    @objc func returnButtonTapped(_ sender: SMNEButton) {
        if let navCon = self.navigationController {
            let viewController = navCon.topViewController
            if let _ = viewController as? TableViewControllerNewPatient_S1 {
                
            } else if let _ = viewController as? TableViewControllerNewPatient_S2 {
                navCon.popViewController(animated: true)
            }
            else if let _ = viewController as? TableViewControllerNewPatient_S3 {
                navCon.popViewController(animated: true)
            }
            else if let _ = viewController as? TableViewControllerNewPatient_S4 {
                navCon.popViewController(animated: true)
            }
            else if let _ = viewController as? TableViewControllerNewPatient_S5 {
                navCon.popViewController(animated: true)
            }
        }
    }

}

extension TableViewControllerNewPatient_S1: RadioCellDelegate, OpenCellDelegate, ListCellDelegate, RadioRadioDelegate, CellInfoChangeDelegate {
    func infoChange(id: String, info: Float) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func infoChange(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func infoChange(id: String, info: Bool) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    
    func listChanged(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func openChanged(id: String, info: Any) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func radioChanged(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
}
