//
//  ViewControllerIntro.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 08/02/21.
//

import UIKit
import MaterialComponents

class ViewControllerIntro: UIViewController {
    
    @IBOutlet weak var lastPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var loginButton: MDCButton!
    
    var index = 0
    
    let info: [IntroInfo] = introInfoArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lastPageButton.layer.cornerRadius = 10
        nextPageButton.layer.cornerRadius = 10
        
        loginButton.setBorderColor(.C00D9CC(), for: .normal)
        loginButton.setBorderWidth(1.0, for: .normal)
        loginButton.setBackgroundColor(.white)
        updateInfo()
        
        
    }
    
    func updateInfo() {
        pageControl.currentPage = index
        titleLabel.text = info[index].title
        subLabel.text = info[index].info
    }
    
    @IBAction func lastButtonTapped(_ sender: Any) {
        if index > 0 {
            index -= 1
            if index == 0 {
                lastPageButton.isHidden = true
            }
            updateInfo()
        }
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        if index < 2 {
            if index == 0 {
                lastPageButton.isHidden = false
            }
            index += 1
            updateInfo()
        }
    }
    
    @IBAction func pageControlChanged(_ sender: UIPageControl) {
        index = sender.currentPage
        updateInfo()
        if index == 0 {
            lastPageButton.isHidden = true
        } else {
            lastPageButton.isHidden = false
        }
    }
}
