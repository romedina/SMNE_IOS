//
//  SMNETextField.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 21/02/22.
//

import UIKit

public class SMNETextField: UITextField {
    
//    public init() {
//        super.init(frame: .zero)
////        setup()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        setup()
//    }
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
////        setup()
//    }
    
    private var centerYConstraint: NSLayoutConstraint?
    let placeholderLabel = UILabel()
    
    let assistLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.text = ""
        return view
    }()
    
    let border: CALayer = {
        let view = CALayer()
        view.borderColor = UIColor.C00D9CC().cgColor
        view.borderWidth = 1.0
        view.cornerRadius = 8
        return view
    }()
    
    public func setup() {
        self.addTarget(self, action: #selector(textFieldDidBegin(_:)), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldDidEnd(_:)), for: .editingDidEnd)
        self.borderStyle = .none
        
        self.textColor = UIColor.C052D6C()
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = false
        self.attributedPlaceholder = NSAttributedString(
            string: self.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.clear]
        )
        
        placeholderLabel.text = self.placeholder
        placeholderLabel.textColor = UIColor.C00D9CC()
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.backgroundColor = .white
        self.addSubview(placeholderLabel)
        self.addSubview(assistLabel)
        self.leftView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            view.backgroundColor = .clear
            return view
        }()
        self.leftViewMode = .always
        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            
            assistLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            assistLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 2),
        ])
        
        centerYConstraint?.isActive = false
        if text != nil && text != "" {
            centerYConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: self.topAnchor)
        } else {
            centerYConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        }
        centerYConstraint?.isActive = true
        
        self.layer.borderWidth = 0
    }
    
    public func movePlaceHolder(isUp: Bool) {
        centerYConstraint?.isActive = false
        if isUp {
            centerYConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: self.topAnchor)
        } else {
            centerYConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        }
        centerYConstraint?.isActive = true
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
            self.layoutIfNeeded()
        }
    }
    
    public func setErrorWith(text errorText: String?) {
        placeholderLabel.textColor = UIColor.red
        border.borderColor = UIColor.red.cgColor
        assistLabel.text = errorText
        assistLabel.textColor = .red
    }
    
    public func setNormal() {
        placeholderLabel.textColor = UIColor.C00D9CC()
        border.borderColor = UIColor.C00D9CC().cgColor
        assistLabel.text = ""
    }
    
    public func setTrailingView(trailingView: UIView) {
        trailingView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(trailingView)
        
        NSLayoutConstraint.activate([
            trailingView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            trailingView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    @objc func textFieldDidBegin(_ textField: UITextField) {
        movePlaceHolder(isUp: true)
    }
    
    @objc func textFieldDidEnd(_ textField: UITextField) {
        if self.text == nil || self.text == "" {
            movePlaceHolder(isUp: false)
        }
    }
    
    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 30, y: 0, width: 20 , height: bounds.height)
    }
}

extension UITextField {
    public func setTextFieldLook() {
        self.borderStyle = .none
        self.leftView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            view.backgroundColor = .clear
            return view
        }()
        self.leftViewMode = .always
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.C00D9CC().cgColor
        self.layer.cornerRadius = 8
        self.textColor = UIColor.C052D6C()
        
        self.attributedPlaceholder = NSAttributedString(
            string: self.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.C00D9CC(), NSAttributedString.Key.font: UIFont(name: "Open Sans Regular", size: 16) ?? UIFont()]
        )
    }
}


open class GenericTextField: UITextField {

    var pointerXCoinstraint: NSLayoutConstraint?
    let label = UILabel()
    let underline = UIView()
    
    let assistLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.text = ""
        return view
    }()
    
    func setup() {
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.layer.masksToBounds = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(activateFromView))
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.layer.borderWidth = 1
        underline.layer.cornerRadius = 10
        underline.layer.borderColor = UIColor.C00D9CC().cgColor
        underline.addGestureRecognizer(tap)
        self.addSubview(underline)
        underline.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        underline.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        underline.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        underline.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(assistLabel)
        NSLayoutConstraint.activate([
            assistLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 2),
            assistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
        self.textColor = .C052D6C()
        self.addTarget(self, action: #selector(textFieldDidBegin(_:)), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldDidEnd(_:)), for: .editingDidEnd)
        label.backgroundColor = .white
        label.textColor = .C00D9CC()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Open Sans Regular", size: 16.0)
        self.addSubview(label)
        if self.text == nil || self.text == "" {
            pointerXCoinstraint?.isActive = false
            pointerXCoinstraint = label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
            pointerXCoinstraint?.isActive = true
        } else {
            pointerXCoinstraint?.isActive = false
            pointerXCoinstraint = label.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 0)
            pointerXCoinstraint?.isActive = true
        }
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    public func setValues(placeholder: String, text: String?) {
        label.text = placeholder
        if text != nil {
            self.text = text
            pointerXCoinstraint?.isActive = false
            pointerXCoinstraint = label.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 0)
            pointerXCoinstraint?.isActive = true
        }
    }
    
    public func setError(message: String) {
        label.textColor = UIColor.red
        underline.layer.borderColor = UIColor.red.cgColor
        assistLabel.text = message
        assistLabel.textColor = .red
    }
    
    public func setNormal() {
        label.textColor = UIColor.C00D9CC()
        underline.layer.borderColor = UIColor.C00D9CC().cgColor
        assistLabel.text = ""
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    @objc func activateFromView() {
        self.becomeFirstResponder()
    }
        
    @objc func textFieldDidBegin(_ textField: UITextField) {
        self.pointerXCoinstraint?.isActive = false
        self.pointerXCoinstraint = self.label.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 0)
        self.pointerXCoinstraint?.isActive = true
        self.label.textColor = .C00D9CC()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func textFieldDidEnd(_ textField: UITextField) {
        if self.text == nil || self.text == "" {
            self.pointerXCoinstraint?.isActive = false
            self.pointerXCoinstraint = self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
            self.pointerXCoinstraint?.isActive = true
            self.label.textColor = .C00D9CC()
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.layoutIfNeeded()
        }
    }
}
