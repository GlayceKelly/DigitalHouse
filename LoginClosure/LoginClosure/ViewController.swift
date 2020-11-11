//
//  ViewController.swift
//  LoginClosure
//
//  Created by Glayce Kelly on 24/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    //MARK: - Attributed
    
    var users: [User] = []
    var manager: RegisterManager = RegisterManager()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Private methods
    
    private func login(email: String, password: String) {
        manager.users = users
        
        let userType: UserType = manager.login(email: email, password: password)
        
        switch userType {
        case .userLogedSuccess:
            showAlert(message: "Usuário logado com sucesso!")
        case .invalidPassword:
            showAlert(message: "Senha inválida!")
        case .userRegister:
            showAlert(message: "Cadastre-se")
        case .invalidData:
            showAlert(message: "Digite um e-mail válido. A senha deve ter mais de 6 caracteres.")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Actions
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let email: String = emailTextField.text else { return }
        guard let password: String = passwordTextField.text else { return }
        
        login(email: email, password: password)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        guard let email: String = emailTextField.text else { return }
        
        if manager.isUserRegister(email: email) {
            showAlert(message: "Este usuário já tem cadastro!")
        } else {
            if let registerViewController = RegisterViewController.getController() {
                guard let password: String = passwordTextField.text else { return }
                
                registerViewController.email = email
                registerViewController.password = password
                
                present(registerViewController, animated: true, completion: nil)
                
                registerViewController.registerCompletion { (user) in
                    let user: User = user
                    self.users.append(user)
                    print("usuário cadastrado com sucesso")
                    self.showAlert(message: "Usuário cadastrado com sucesso!")
                }
            }
        }
    }
}
