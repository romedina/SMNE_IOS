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
    
    static var wtoastContainer: UIView = UIView()
    static var backView: UIView = UIView()
    
    static func show(message: String, controller: UIViewController, type: AlertType, handler: @escaping () -> Void) {
        var parentBackground = UIColor()
        var parentBorder = UIColor()
        var imageViewBack = UIColor()
        var textColor = UIColor()
        var icon = UIImage()
        var time = 1.5
        
        switch type {
        case .Error:
            parentBorder = UIColor(red: 250/255, green: 11/255, blue: 11/255, alpha: 1)
            parentBackground = UIColor(red: 255/255, green: 228/255, blue: 228/255, alpha: 1)
            imageViewBack = UIColor(red: 250/255, green: 11/255, blue: 11/255, alpha: 1)
            textColor = UIColor(red: 178/255, green: 0, blue: 0, alpha: 1)
            icon = UIImage(named: "error") ?? UIImage()
            time = 3.0
            break
        case .Success:
            parentBorder =  UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1)
            parentBackground = UIColor(red: 0.85, green: 0.98, blue: 0.97, alpha: 1)
            imageViewBack = UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1)
            textColor = UIColor(red: 0.23, green: 0.53, blue: 0.5, alpha: 1)
            icon = UIImage(named: "check") ?? UIImage()
            break
        case .Warning:
            parentBorder = UIColor(red: 214/255, green: 179/255, blue: 45/255, alpha: 1)
            parentBackground = UIColor(red: 252/255, green: 246/255, blue: 223/255, alpha: 1)
            imageViewBack = UIColor(red: 214/255, green: 179/255, blue: 45/255, alpha: 1)
            textColor = UIColor(red: 159/255, green: 132/255, blue: 29/255, alpha: 1)
            icon = UIImage(named: "warning") ?? UIImage()
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
        
        let iconImage = UIImageView(frame: CGRect())
        iconImage.image = icon
        iconImage.clipsToBounds = true
        
        iconView.addSubview(iconImage)
        toastContainer.addSubview(iconView)
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
        toastContainer.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 20).isActive = true
        toastContainer.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -20).isActive = true
        toastContainer.heightAnchor.constraint(equalToConstant: 87).isActive = true
        toastContainer.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 50).isActive = true
        
        iconView.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: 12).isActive = true
        iconView.centerYAnchor.constraint(equalTo: toastContainer.centerYAnchor).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 62).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 62).isActive = true
        
        iconImage.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        toastLabel.centerYAnchor.constraint(equalTo: toastContainer.centerYAnchor).isActive = true
        toastLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12).isActive = true
        toastLabel.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -12).isActive = true

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: time, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
                handler()
            })
        })
    }
    
    static func show(message: String, controller: UIViewController, type: AlertType, handler: @escaping (_ flag: Bool) -> Void) {
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
            icon = UIImage(named: "error") ?? UIImage()
            break
        case .Success:
            parentBorder =  UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1)
            parentBackground = UIColor(red: 0.85, green: 0.98, blue: 0.97, alpha: 1)
            imageViewBack = UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1)
            textColor = UIColor(red: 0.23, green: 0.53, blue: 0.5, alpha: 1)
            icon = UIImage(named: "check") ?? UIImage()
            break
        case .Warning:
            parentBorder = UIColor(red: 214/255, green: 179/255, blue: 45/255, alpha: 1)
            parentBackground = UIColor(red: 252/255, green: 246/255, blue: 223/255, alpha: 1)
            imageViewBack = UIColor(red: 214/255, green: 179/255, blue: 45/255, alpha: 1)
            textColor = UIColor(red: 159/255, green: 132/255, blue: 29/255, alpha: 1)
            icon = UIImage(named: "warning") ?? UIImage()
            break
        }
        
        backView.backgroundColor = UIColor(red: 0.01, green: 0.17, blue: 0.42, alpha: 0.46)
        backView.clipsToBounds = true
        backView.alpha = 0.0
        
        wtoastContainer = UIView(frame: CGRect())
        wtoastContainer.backgroundColor = parentBackground
        wtoastContainer.alpha = 0.0
        wtoastContainer.layer.cornerRadius = 21;
        wtoastContainer.layer.borderWidth = 1
        wtoastContainer.layer.borderColor = parentBorder.cgColor
        wtoastContainer.clipsToBounds  =  true

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
        
        let iconImage = UIImageView(frame: CGRect())
        iconImage.image = icon
        iconImage.clipsToBounds = true
        
        let buttonStack = UIStackView(frame: CGRect())
        buttonStack.axis = .horizontal
        buttonStack.clipsToBounds = true
        buttonStack.spacing = 10
        buttonStack.distribution = .fillEqually
        
        let yesButton = UIButton(frame: CGRect())
        yesButton.clipsToBounds = true
        yesButton.setTitle("Aceptar", for: .normal)
        yesButton.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14.0)
        yesButton.titleLabel?.font.withSize(14.0)
        yesButton.setTitleColor(UIColor(red: 0.62, green: 0.51, blue: 0.11, alpha: 1), for: .normal)
        yesButton.layer.borderWidth = 1
        yesButton.layer.borderColor = UIColor(red: 0.83, green: 0.7, blue: 0.17, alpha: 1).cgColor
        yesButton.layer.cornerRadius = 7
        yesButton.addAction {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                wtoastContainer.alpha = 0.0
                backView.alpha = 0.0
            } completion: { _ in
                wtoastContainer.removeFromSuperview()
                backView.removeFromSuperview()
            }
            handler(true)
        }
        
        let noButton = UIButton(frame: CGRect())
        noButton.clipsToBounds = true
        noButton.setTitle("Cancelar", for: .normal)
        noButton.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14.0)
        noButton.titleLabel?.font.withSize(14.0)
        noButton.setTitleColor(UIColor(red: 0.62, green: 0.51, blue: 0.11, alpha: 1), for: .normal)
        noButton.layer.borderWidth = 1
        noButton.layer.borderColor = UIColor(red: 0.83, green: 0.7, blue: 0.17, alpha: 1).cgColor
        noButton.layer.cornerRadius = 7
        noButton.addAction {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                wtoastContainer.alpha = 0.0
                backView.alpha = 0.0
            } completion: { _ in
                wtoastContainer.removeFromSuperview()
                backView.removeFromSuperview()
            }
            handler(false)
        }
        
        buttonStack.addArrangedSubview(yesButton)
        buttonStack.addArrangedSubview(noButton)
        
        iconView.addSubview(iconImage)
        wtoastContainer.addSubview(iconView)
        wtoastContainer.addSubview(buttonStack)
        wtoastContainer.addSubview(toastLabel)
        controller.view.addSubview(backView)
        controller.view.addSubview(wtoastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        wtoastContainer.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: controller.view.heightAnchor).isActive = true
        backView.widthAnchor.constraint(equalTo: controller.view.widthAnchor).isActive = true
        
        wtoastContainer.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 20).isActive = true
        wtoastContainer.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -20).isActive = true
        wtoastContainer.heightAnchor.constraint(equalToConstant: 103).isActive = true
        wtoastContainer.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 50).isActive = true
        
        iconView.leadingAnchor.constraint(equalTo: wtoastContainer.leadingAnchor, constant: 12).isActive = true
        iconView.centerYAnchor.constraint(equalTo: wtoastContainer.centerYAnchor).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 62).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 62).isActive = true
        
        iconImage.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        toastLabel.topAnchor.constraint(equalTo: wtoastContainer.topAnchor, constant: 15).isActive = true
        toastLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12).isActive = true
        toastLabel.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -12).isActive = true
        
        buttonStack.topAnchor.constraint(equalTo: toastLabel.bottomAnchor, constant: 9).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 20).isActive = true
        buttonStack.widthAnchor.constraint(equalToConstant: 210).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            wtoastContainer.alpha = 1.0
            backView.alpha = 1.0
        }, completion: { _ in
        })
        
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        @objc class ClosureSleeve: NSObject {
            let closure:()->()
            init(_ closure: @escaping()->()) { self.closure = closure }
            @objc func invoke() { closure() }
        }
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
