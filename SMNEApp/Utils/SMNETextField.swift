//
//  SMNETextField.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 21/02/22.
//

import UIKit

public class SMNETextField: UITextField {
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
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
        view.borderWidth = 2.0
        view.cornerRadius = 8
        return view
    }()
    
    private func setup() {
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
            placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            assistLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            assistLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 2),
        ])
        
        centerYConstraint?.isActive = false
        centerYConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        centerYConstraint?.isActive = true
    }
    
    public func movePlaceHolder(isUp: Bool) {
        centerYConstraint?.isActive = false
        if isUp {
            centerYConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: self.topAnchor)
        } else {
            centerYConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        }
        centerYConstraint?.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
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
