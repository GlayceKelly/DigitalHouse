//
//  RegisterManager.swift
//  LoginClosure
//
//  Created by Glayce Kelly on 25/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import Foundation

enum UserType {
    case userLogedSuccess
    case invalidPassword
    case userRegister
    case invalidData
}

class RegisterManager {
    
    var users: [User] = []
    
    func registerUser(email: String, password: String) -> User? {
        if isUserRegister(email: email) {
            return nil
        } else {
            if isValidData(email: email, password: password) {
                let user: User = User(email: email, password: password)
                users.append(user)
                
                return user
            }
        }
        
        return nil
    }
    
    func login(email: String, password: String) -> UserType {
        if isValidData(email: email, password: password) {
            if let user = getUserWithEmail(email: email) {
                if user.password == password {
                    return .userLogedSuccess
                } else {
                    return .invalidPassword
                }
            } else {
                return .userRegister
            }
        } else {
            return .invalidData
        }
    }
    
    func isUserRegister(email: String) -> Bool {
        for user in users {
            if user.email == email {
                return true
            }
        }
        
        return false
    }
    
    func isValidData(email: String, password: String) -> Bool {
        if email == "" {
            return false
        }
        
        if password == "" || password.count < 6 {
            return false
        }
        
        return true
    }
    
    func getUserWithEmail(email: String) -> User? {
        for user in users {
            if user.email.lowercased() == email.lowercased() {
                return user
            }
        }
        return nil
    }
    
}
