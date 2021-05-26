//
//  ViewControllerGetDocument.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 25/05/21.
//

import UIKit

class ViewControllerGetDocument: UIViewController {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var downloadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parentView.layer.cornerRadius = 8
        downloadButton.layer.cornerRadius = 8
    }
    
    @IBAction func downloadTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "pdfViewer", sender: self)
    }
    
}

extension ViewControllerGetDocument {
    
}
