//
//  RegisterViewModel.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/04/22.
//

import Foundation


class RegisterViewModel {
    private var name, surname, email, secret, confirmSecret: String?
    private var termsAccepted = false
    
    public func setName(name: String?) {
        self.name = name
    }
    
    public func setSurname(surname: String?) {
        self.surname = surname
    }
    
    public func setEmail(email: String?) {
        guard let newEmail = email, newEmail.isValidEmail() else {
            self.email = nil
            return
        }
        self.email = email
    }
    
    public func setSecret(secret: String?) {
        self.secret = secret
    }
    
    public func setConfirmSecret(confirmSecret: String?) {
        self.confirmSecret = confirmSecret
    }
    
    public func setAcceptedTerms(accepted: Bool) {
        termsAccepted = accepted
    }
    
    public func getAccepetedTerms() -> Bool {
        return termsAccepted
    }
    
    public func validateInfo() -> Bool {
        if !self.termsAccepted {
            return false
        }
        if name == nil || name == "" {
            return false
        }
        if surname == nil || surname == "" {
            return false
        }
        if email == nil || email == "" {
            return false
        }
        if secret == nil || secret == "" {
            return false
        }
        if confirmSecret == nil || confirmSecret == "" {
            return false
        }
        
        return true
    }
    
    public func validateSecret(_ confirmSecret: String?) -> Bool {
        return self.secret == confirmSecret
    }
    
    public func getEmailSecret() -> [String]? {
        guard let newEmail = self.email, let newSecret = self.secret, let newName = self.name, let newSurename = self.surname else { return nil }
        return [newEmail, newSecret, newName, newSurename]
    }
    
}
