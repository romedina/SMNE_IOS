//
//  Extensions.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 22/02/21.
//

import UIKit

extension UITextField {
    func isLastChar() {
        if let char = text?.popLast() {
            if !char.isNumber {
                text?.append(char)
            }
        }
    }
    
    func isLastNumber() {
        if let char = text?.popLast() {
            if char.isNumber {
                text?.append(char)
            }
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: text)
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
