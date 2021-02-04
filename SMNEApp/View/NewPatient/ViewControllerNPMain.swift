//
//  ViewControllerNPMain.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 29/01/21.
//

import UIKit
import MaterialComponents.MDCButton

class ViewControllerNPMain: UIViewController {
    
    var pageViewCotroller: ViewControllerNPPageView!
    @IBOutlet weak var returnButton: MDCButton!
    @IBOutlet weak var nextButton: MDCButton!
    
    var index = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        returnButton.setBorderColor(.C2(), for: .normal)
        returnButton.setBorderWidth(1, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PVCMainSegue" {
            if segue.destination.isKind(of: ViewControllerNPPageView.self) {
                pageViewCotroller = (segue.destination as! ViewControllerNPPageView)
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: MDCButton) {
        
        if index < 4 {
            index += 1
            pageViewCotroller.setViewControllerFromIndex(index: index)
        }
        
    }
    
    @IBAction func returnButtonTapped(_ sender: MDCButton) {
        if index > 0 {
            index -= 1
            pageViewCotroller.setViewControllerFromIndex(index: index)
        }
    }
    
}
