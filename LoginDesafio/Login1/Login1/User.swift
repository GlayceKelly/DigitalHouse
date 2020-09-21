//
//  User.swift
//  Login
//
//  Created by Glayce Kelly on 21/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import Foundation

class User {
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
