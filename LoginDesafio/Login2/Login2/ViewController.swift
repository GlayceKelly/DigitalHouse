//
//  ViewController.swift
//  Login2
//
//  Created by Glayce Kelly on 21/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Attributes
    
    var users: [User] = [User]()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        registerButton.layer.cornerRadius = 10
    }

    // MARK: - Methods
    
    private func login(email: String, password: String) {
        if let user = getUserWithEmail(email: email) {
            if user.password == password {
                showAlert(message: "Usuário logado com sucesso!")
            } else {
                showAlert(message: "Usuário inválido!")
            }
        } else {
            showAlert(message: "Cadastre-se")
        }
    }
    
    private func registerUser(email: String, password: String) {
        if isUserRegister(email: email) {
            showAlert(message: "Usuário já registrado!")
        } else {
            if isValidData() {
                let user: User = User(email: email, password: password)
                users.append(user)
                
                showAlert(message: "Usuário cadastrado com sucesso!")
            }
        }
    }
    
    private func getUserWithEmail(email: String) -> User? {
        for user in users {
            if user.email.lowercased() == email.lowercased() {
                return user
            }
        }
        return nil
    }
    
    func isUserRegister(email: String) -> Bool {
        for user in users {
            if user.email == email {
                return true
            }
        }

        return false
    }
    
    private func isValidData() -> Bool {
        if emailTextField.text == "" {
            return false
        }
        
        if passwordTextField.text == "" || passwordTextField.text?.count ?? 0 < 6 {
            return false
        }
        
        return true
    }
    
    private func clean() {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions

    @IBAction func loginAction(_ sender: UIButton) {
        if isValidData() {
            guard let email: String = emailTextField.text else { return }
            guard let password: String = passwordTextField.text else { return }
            
            login(email: email, password: password)
            clean()
        } else {
            showAlert(message: "Digite um e-mail válido. A senha deve ter mais de 6 caracteres.")
        }
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        if isValidData() {
            guard let email: String = emailTextField.text else { return }
            guard let password: String = passwordTextField.text else { return }
            
            registerUser(email: email, password: password)
            clean()
        } else {
            showAlert(message: "Digite um e-mail válido. A senha deve ter mais de 6 caracteres.")
        }
    }
}
