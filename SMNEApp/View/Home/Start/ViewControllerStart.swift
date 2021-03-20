//
//  ViewControllerStart.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/02/21.
//

import UIKit

class ViewControllerStart: UIViewController {
    
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var tableViewOptions: UITableView!
    
    let titles = ["Tratamiento farmacológico DM2", "Consulta de algoritmo para estudio", "Gestión de pacientes"]
    let buttonTitles = ["Iniciar diagnóstico", "Ver algoritmo", "Pacientes"]
    let titleColors: [UIColor] = [.white, .C052D6C(), .C052D6C()]
    let backColors: [UIColor] = [.C0093FF(), .C00D9CC(), .C9FDDF9()]
    let images: [UIImage] = [#imageLiteral(resourceName: "phone"), #imageLiteral(resourceName: "board"), #imageLiteral(resourceName: "info")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.layer.cornerRadius = 20
        tableViewOptions.delegate = self
        tableViewOptions.dataSource = self
        
    }
    @IBAction func buttonTapped(_ sender: Any) {
        AlertToast.show(message: "Hola", controller: self, type: .Error)
    }
}

extension ViewControllerStart: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOptions.dequeueReusableCell(withIdentifier: "option", for: indexPath) as! TableViewCellStartOption
        
        cell.setInfo(titleText: titles[indexPath.row], buttonTitle: buttonTitles[indexPath.row], textColor: titleColors[indexPath.row], backColor: backColors[indexPath.row], image: images[indexPath.row])
        cell.delegate = self
        
        return cell
    }
}

extension ViewControllerStart: StartOptionDelegate {
    func optionSelected(option: String) {
        if option == "patients" {
            tabBarController?.selectedIndex = 1
        } else if option == "algorithm" {
            tabBarController?.selectedIndex = 2
        } else {
            self.performSegue(withIdentifier: "newPatient", sender: self)
        }
    }
}
