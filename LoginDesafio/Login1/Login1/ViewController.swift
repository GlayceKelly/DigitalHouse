//
//  ViewController.swift
//  Login
//
//  Created by Glayce Kelly on 21/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Attributes
    
    var users: [User] = [User]()
    var user: User?

    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 10
    }
    
    // MARK: - Methods
    
    private func registerUser() {
        guard let email: String = emailTextField.text else { return }
        guard let password: String = passwordTextField.text else { return }
        
        if isNewUser(email: email) {
            let user: User = User(email: email, password: password)
            users.append(user)
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .red
        }
    }
    
    private func isNewUser(email: String) -> Bool {
        for user in users {
            if user.email == email {
                return false
            }
        }

        return true
    }
    
    func cleanTextField() {
        emailTextField.text = ""
        passwordTextField.text = ""
    }

    // MARK: - Actions

    @IBAction func registerAction(_ sender: UIButton) {
        registerUser()
        cleanTextField()
    }
}

