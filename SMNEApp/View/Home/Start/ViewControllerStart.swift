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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.layer.cornerRadius = 20
        tableViewOptions.delegate = self
        tableViewOptions.dataSource = self
    }
}

extension ViewControllerStart: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOptions.dequeueReusableCell(withIdentifier: "option", for: indexPath) as! TableViewCellStartOption
        
        return cell
    }
    
    
}
