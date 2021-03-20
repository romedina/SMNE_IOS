//
//  AlertToast.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 16/03/21.
//

import UIKit

class AlertToast {
    enum AlertType {
        case Success
        case Error
        case Warning
    }
    
    static func show(message: String, controller: UIViewController, type: AlertType) {
        var parentBackground = UIColor()
        var parentBorder = UIColor()
        var imageViewBack = UIColor()
        var textColor = UIColor()
        var icon = UIImage()
        
        switch type {
        case .Error:
            parentBorder = UIColor(red: 250/255, green: 11/255, blue: 11/255, alpha: 1)
            parentBackground = UIColor(red: 255/255, green: 228/255, blue: 228/255, alpha: 1)
            imageViewBack = UIColor(red: 250/255, green: 11/255, blue: 11/255, alpha: 1)
            textColor = UIColor(red: 178/255, green: 0, blue: 0, alpha: 1)
            break
        case .Success:
            parentBorder =  UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1)
            parentBackground = UIColor(red: 0.85, green: 0.98, blue: 0.97, alpha: 1)
            imageViewBack = UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1)
            textColor = UIColor(red: 0.23, green: 0.53, blue: 0.5, alpha: 1)
            break
        case .Warning:
            parentBorder = UIColor(red: 214/255, green: 179/255, blue: 45/255, alpha: 1)
            parentBackground = UIColor(red: 252/255, green: 246/255, blue: 223/255, alpha: 1)
            imageViewBack = UIColor(red: 214/255, green: 179/255, blue: 45/255, alpha: 1)
            textColor = UIColor(red: 159/255, green: 132/255, blue: 29/255, alpha: 1)
            break
        }
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = parentBackground
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 21;
        toastContainer.layer.borderWidth = 1
        toastContainer.layer.borderColor = parentBorder.cgColor
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        
        toastLabel.textColor = textColor
        toastLabel.textAlignment = .left
        toastLabel.font = UIFont(name: "OpenSans-Bold", size: 14.0)
        toastLabel.font.withSize(14.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        let iconView = UIView(frame: CGRect())
        iconView.backgroundColor = imageViewBack
        iconView.layer.cornerRadius = 13
        iconView.clipsToBounds = true
        
        toastContainer.addSubview(iconView)
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        toastContainer.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 20).isActive = true
        toastContainer.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -20).isActive = true
        toastContainer.heightAnchor.constraint(equalToConstant: 87).isActive = true
        toastContainer.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 50).isActive = true
        
        iconView.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: 12).isActive = true
        iconView.centerYAnchor.constraint(equalTo: toastContainer.centerYAnchor).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 52).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 52).isActive = true
        
        toastLabel.centerYAnchor.constraint(equalTo: toastContainer.centerYAnchor).isActive = true
        toastLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12).isActive = true
        toastLabel.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -12).isActive = true

//        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .centerY, relatedBy: .equal, toItem: toastContainer, attribute: .centerY, multiplier: 1, constant: 0)
//        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .centerX, relatedBy: .equal, toItem: toastContainer, attribute: .centerX, multiplier: 1, constant: 0)
//        toastContainer.addConstraints([a1, a2])
//
//        let d1 = NSLayoutConstraint(item: iconView, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 12)
//        let d2 = NSLayoutConstraint(item: iconView, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 10)
//        let d3 = NSLayoutConstraint(item: iconView, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: 81)
//        let d4 = NSLayoutConstraint(item: iconView, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: 10)
//        toastContainer.addConstraints([d1, d2, d3, d4])
//
//        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 20)
//        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -20)
//        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .top, relatedBy: .equal, toItem: controller.view, attribute: .top, multiplier: 1, constant: 50)
//        let c4 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: controller.view, attribute: .top, multiplier: 1, constant: 137)
//        controller.view.addConstraints([c1, c2, c3, c4])

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}
