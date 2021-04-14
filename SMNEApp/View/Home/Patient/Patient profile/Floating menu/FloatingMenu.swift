//
//  FloatingMenu.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 13/04/21.
//

import UIKit

protocol FloatingMenuDelegate {
    func goToNextEv()
    func goToNewRev()
    func goToFEv()
}

class FloatingMenu: UIViewController {
    
    @IBOutlet weak var floatingMenuView: UIView!
    var delegate: FloatingMenuDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        floatingMenuView.layer.cornerRadius = 10
    }

    @IBAction func closeTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextEvTapped(_ sender: Any) {
        self.dismiss(animated: true) { [weak self] in
            self?.delegate?.goToNextEv()
        }
    }
    
    @IBAction func newRevTapped(_ sender: Any) {
        self.dismiss(animated: true) { [weak self] in
            self?.delegate?.goToNewRev()
        }
    }
    
    @IBAction func fEvTapped(_ sender: Any) {
        self.dismiss(animated: true) { [weak self] in
            self?.delegate?.goToFEv()
        }
    }
}
