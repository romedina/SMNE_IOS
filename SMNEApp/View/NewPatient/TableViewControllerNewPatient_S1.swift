//
//  TableViewControllerNewPatient_S1.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit
import MaterialComponents

protocol InfoChangedDelegate {
    func infoChanged(id: String, info: Any)
}

class TableViewControllerNewPatient_S1: UITableViewController {
    
    let nextButton = MDCButton()
    let returnButton = MDCButton()
    let buttonsStack = UIStackView()
    
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
        let step = step1Cells
        let cellInfo = step1Cells[indexPath.row]
        
        if let info = cellInfo as? OpenCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "open", for: indexPath) as! TableViewCellOpen
            
            cell.setInfo(title: info.title, placeHolder: info.placeHolder)
            cell.delegate = self

            return cell
        } else if let _ = cellInfo as? RadioRadioCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "radio,radio", for: indexPath) as! TableViewCellRadioRadio
            
            
            cell.delegate = self
            
            return cell
        } else if let info = cellInfo as? ListCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! TableViewCellList
            
            cell.setInfo(title: info.title, options: info.options)
            cell.delegate = self
            
            return cell
        } else if let _ = cellInfo as? InfoCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoPatient", for: indexPath) as! TableViewCellInfoPatient
            
            return cell
        } else if let _ = cellInfo as? RadioCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "radio", for: indexPath) as! TableViewCellRadioButton
            
            cell.delegate = self
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 150
        }
        return tableView.rowHeight
    }
    
    @objc func nextButtonTapped(_ sender: MDCButton) {
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
    
    @objc func returnButtonTapped(_ sender: MDCButton) {
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

extension TableViewControllerNewPatient_S1: OpenListCellDelegate, RadioCellDelegate, OpenCellDelegate, ListCellDelegate, RadioRadioDelegate {
    
    func listChanged(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func openChanged(id: String, info: Any) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func radioChanged(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func openChanged(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
    
    func listChange(id: String, info: String) {
        delegate?.infoChanged(id: id, info: info)
    }
}
