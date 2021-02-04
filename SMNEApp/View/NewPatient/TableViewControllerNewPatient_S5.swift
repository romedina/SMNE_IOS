//
//  TableViewControllerNewPatient_S5.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents.MDCButton

class TableViewControllerNewPatient_S5: UITableViewController {
    
    let nextButton = MDCButton()
    let returnButton = MDCButton()
    let buttonsStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .C2()
        nextButton.setTitle("Terminar", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        
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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stepFive.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = stepFive[indexPath.row]
        
        if let info = cellInfo as? TitleCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TableViewCellTitle

            cell.setInfo(title: info.title, subtitle: info.subtitle)

            return cell
        } else if let info = cellInfo as? StepperCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "stepper", for: indexPath) as! TableViewCellStepper

            cell.setInfo(page: info.page)

            return cell
        } else if let info = cellInfo as? TreatmentCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "treatment", for: indexPath) as! TableViewCellTreatment
            
            cell.setInfo(title: info.title, subTitle: info.subTitle)

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }

}
