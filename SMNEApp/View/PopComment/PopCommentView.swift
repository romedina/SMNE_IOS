//
//  PopCommentView.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 02/04/21.
//

import UIKit

class PopCommentView {
    
    static var toastContainer: UIView = UIView()
    static var closeButton = UIButton()
    static var backView: UIView = UIView()
    
    static func show(date: String, message: String, controller: UIViewController, handler: @escaping () -> Void) {
        var parentBackground = UIColor()
        var parentBorder = UIColor()
        var textColor = UIColor()
        
        parentBorder =  UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1)
        parentBackground = .white
        textColor = UIColor(red: 0.23, green: 0.53, blue: 0.5, alpha: 1)
        
        toastContainer = UIView(frame: CGRect())
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
        
        let dateLabel = UILabel(frame: CGRect())
        dateLabel.textColor = textColor
        dateLabel.textAlignment = .left
        dateLabel.font = UIFont(name: "OpenSans-Bold", size: 14.0)
        dateLabel.font.withSize(14.0)
        dateLabel.text = date
        dateLabel.clipsToBounds  =  true
        dateLabel.numberOfLines = 0
        
        backView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        backView.clipsToBounds = true
        backView.alpha = 0.0
        
        closeButton = UIButton()
        closeButton.alpha = 0.0
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.backgroundColor = .white
        closeButton.layer.cornerRadius = 15
        closeButton.layer.borderWidth = 1
        closeButton.layer.borderColor = UIColor.black.cgColor
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        toastContainer.addSubview(dateLabel)
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(backView)
        controller.view.addSubview(toastContainer)
        controller.view.addSubview(closeButton)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: controller.view.heightAnchor).isActive = true
        backView.widthAnchor.constraint(equalTo: controller.view.widthAnchor).isActive = true
        
        toastContainer.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 20).isActive = true
        toastContainer.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -20).isActive = true
        toastContainer.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: 12).isActive = true
        dateLabel.topAnchor.constraint(equalTo: toastContainer.topAnchor, constant: 20).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: toastContainer.trailingAnchor).isActive = true
        
        toastLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        toastLabel.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: 12).isActive = true
        toastLabel.trailingAnchor.constraint(equalTo: toastContainer.trailingAnchor, constant: -12).isActive = true
        toastLabel.bottomAnchor.constraint(equalTo: toastContainer.bottomAnchor, constant: -20).isActive = true
        
        closeButton.centerXAnchor.constraint(equalTo: toastContainer.trailingAnchor).isActive = true
        closeButton.centerYAnchor.constraint(equalTo: toastContainer.topAnchor).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
            closeButton.alpha = 1.0
            backView.alpha = 1.0
        }, completion: { _ in
            
        })

    }
    
    @objc static func close() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            toastContainer.alpha = 0.0
            closeButton.alpha = 0.0
            backView.alpha = 0.0
        }, completion: {_ in
            toastContainer.removeFromSuperview()
            closeButton.removeFromSuperview()
            backView.removeFromSuperview()
        })
    }
}
