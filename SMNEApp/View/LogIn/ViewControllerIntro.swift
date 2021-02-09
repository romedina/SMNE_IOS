//
//  ViewControllerIntro.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit

class ViewControllerIntro: UIViewController {
    
    @IBOutlet weak var lastPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var index = 0
    
    let info = ["prueba", "prueba2", "prueba3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lastPageButton.layer.cornerRadius = 10
        nextPageButton.layer.cornerRadius = 10
    }
    
    @IBAction func lastButtonTapped(_ sender: Any) {
        if index > 0 {
            index -= 1
            pageControl.currentPage = index
            titleLabel.text = info[index]
            if index == 0 {
                lastPageButton.isHidden = true
            }
        }
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        if index < 2 {
            if index == 0 {
                lastPageButton.isHidden = false
            }
            index += 1
            pageControl.currentPage = index
            titleLabel.text = info[index]
        }
    }
    
}
