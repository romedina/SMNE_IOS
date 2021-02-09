//
//  Colors.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import Foundation
import UIKit
import MaterialComponents

extension UIColor {
    
    //0093FF
    class func C1() -> UIColor {
        return UIColor(red:0.00, green:0.576, blue:1.00, alpha:1.0)
    }
    
    //00D9CC
    class func C2() -> UIColor {
        return UIColor(red:0.00, green:0.851, blue:0.8, alpha:1.0)
    }
    
    //052D6C
    class func C3() -> UIColor {
        return UIColor(red: 0.020, green: 0.176, blue: 0.424, alpha: 1.0)
    }
    
    //9FDDF9
    class func C4() -> UIColor {
        return UIColor(red: 0.6235, green: 0.8667, blue: 0.9765, alpha: 1.0)
    }
}

let appTheme: MDCContainerScheme = {
    let theme = MDCContainerScheme()
    theme.colorScheme.primaryColor = .C2()
    theme.colorScheme.onSurfaceColor = .C2()
    return theme
}()
