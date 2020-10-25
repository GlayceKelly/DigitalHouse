//
//  User.swift
//  LoginClosure
//
//  Created by Glayce Kelly on 24/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import Foundation

struct User {
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
