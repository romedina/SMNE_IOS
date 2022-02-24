//
//  TableViewControllerNewPatient_S5.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit

class TableViewControllerNewPatient_S5: UITableViewController {
    
    let nextButton = SMNEButton()
    let returnButton = SMNEButton()
    let buttonsStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .C00D9CC()
        nextButton.setTitle("Terminar", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return step5Cells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = step5Cells[indexPath.row]
        
        if let info = cellInfo as? TreatmentCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "treatment", for: indexPath) as! TableViewCellTreatment
            print(info.options)
            guard let name = stepFive.last as? String else {
                return UITableViewCell()
            }
            cell.setInfo(imageName: name)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "space", for: indexPath)

            return cell
        }
    }

}
