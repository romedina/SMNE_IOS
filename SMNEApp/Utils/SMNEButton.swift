//
//  SMNEButton.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/02/22.
//

import UIKit

public class SMNEButton: UIButton {
    
    private var backgrounds: [UIButton.State.RawValue: UIColor] = [:]
    private var style: SMNEButtonStyle = .none
    
    public enum SMNEButtonStyle {
        case fill
        case outlined
        case text
        case none
    }
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    public init(style: SMNEButtonStyle) {
        super.init(frame: .zero)
        self.style = style
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
    
    public override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? backgrounds[UIButton.State.selected.rawValue] : backgrounds[UIButton.State.normal.rawValue]
        }
    }
    
    private func setup() {
        self.layer.cornerRadius = 8
        self.titleLabel?.font = UIFont(name: "Open Sans Bold", size: 16)
        switch style {
        case .fill:
            setBackgroundColor(.C00D9CC())
            self.setTitleColor(.white, for: .normal)
            break
        case .outlined:
            break
        case .text:
            setBackgroundColor(.white)
            self.setTitleColor(.C00D9CC(), for: .normal)
            break
        default:
            break
        }
    }
    
    public func setBorderColor(_ color: UIColor?, for: UIButton.State) {
        self.layer.borderColor = color?.cgColor
    }
    
    public func setBorderWidth(_ width: CGFloat, for: UIButton.State) {
        self.layer.borderWidth = width
    }
    
    public func setBackgroundColor(_ color: UIColor?) {
        self.backgroundColor = color
    }
    
    public func setBackgroundColor(_ color: UIColor?, for state: UIButton.State) {
        backgrounds[state.rawValue] = color
    }
    
}
