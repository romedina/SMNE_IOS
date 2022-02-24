//
//  SMNEButton.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/02/22.
//

import UIKit

public class SMNEButton: UIButton {
    
    private var backgrounds: [UIButton.State.RawValue: UIColor] = [:]
    
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
    
    public override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? backgrounds[UIButton.State.selected.rawValue] : backgrounds[UIButton.State.normal.rawValue]
        }
    }
    
    private func setup() {
        self.layer.cornerRadius = 8
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
