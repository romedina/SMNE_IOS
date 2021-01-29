//
//  TableViewControllerNewPatient_S1.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit
import MaterialComponents

class TableViewControllerNewPatient_S1: UITableViewController {
    
    let nextButton = MDCButton()
    let returnButton = MDCButton()
    let buttonsStack = UIStackView()
    
    override func viewDidAppear(_ animated: Bool) {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .C2()
        nextButton.setTitle("Siguiente", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        
        returnButton.layer.cornerRadius = 5
        returnButton.setBackgroundColor(.white)
        returnButton.setBorderWidth(1, for: .normal)
        returnButton.setBorderColor(.C2(), for: .normal)
        returnButton.setTitleColor(.C2(), for: .normal)
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
        return 7
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TableViewCellTitle

            cell.setInfo()

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "stepper", for: indexPath) as! TableViewCellStepper

            cell.setInfo(page: 1)

            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoPatient", for: indexPath) as! TableViewCellInfoPatient

            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! TableViewCellList

            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "open,list", for: indexPath) as! TableViewCellOpenList

            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "open", for: indexPath) as! TableViewCellOpen

            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)
            
            return cell
        default:
            break
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "open", for: indexPath) as! TableViewCellOpen

        return cell
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
