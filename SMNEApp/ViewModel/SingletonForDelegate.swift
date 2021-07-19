//
//  SingletonForDelegate.swift
//  SMNEApp
//
//  Created by Branchbit  on 09/07/21.
//

import Foundation

protocol ChangeViewInMainTabDelegate {
    func changeView()
}
class SingletonForDelegate {
    
    public static var shared: SingletonForDelegate = {
        let instance = SingletonForDelegate()
        
        return instance
    }()
    
    private init () { }
    
    public var delegate: ChangeViewInMainTabDelegate?
    public var needToChange = false
    
    
}
