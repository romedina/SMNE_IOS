//
//  AlertService.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 15/03/21.
//

import UIKit

class AlertService {
    func alert() -> UIViewController{
        let storyBoard = UIStoryboard(name: "Alerts", bundle: .main)
        
        let alertVC = storyBoard.instantiateViewController(withIdentifier: "AlertVC") as! ViewControllerAlert
        
        return alertVC
    }
}
