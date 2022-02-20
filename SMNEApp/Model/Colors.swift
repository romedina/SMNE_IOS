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
    class func C0093FF() -> UIColor {
        return UIColor(red:0.00, green:0.576, blue:1.00, alpha:1.0)
    }
    
    //00D9CC
    class func C00D9CC() -> UIColor {
        return UIColor(red:0.00, green:0.851, blue:0.8, alpha:1.0)
    }
    
    //052D6C
    class func C052D6C() -> UIColor {
        return UIColor(red: 0.020, green: 0.176, blue: 0.424, alpha: 1.0)
    }
    
    //9FDDF9
    class func C9FDDF9() -> UIColor {
        return UIColor(red: 0.6235, green: 0.8667, blue: 0.9765, alpha: 1.0)
    }
    
    class func CE0F5F8() ->UIColor {
        return UIColor(red: 0.87, green: 0.96, blue: 0.97, alpha: 1.0)
    }
    
    class func C5FD6CB() -> UIColor {
        return UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1.0)
    }
    
    class func C707070() -> UIColor {
        return UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 1.0)
    }
}

let appTheme: MDCContainerScheme = {
    let theme = MDCContainerScheme()
    theme.colorScheme.primaryColor = .C00D9CC()
    theme.colorScheme.onSurfaceColor = .C00D9CC()
    return theme
}()
