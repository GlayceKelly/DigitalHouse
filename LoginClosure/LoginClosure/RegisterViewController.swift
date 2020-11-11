//
//  RegisterViewController.swift
//  LoginClosure
//
//  Created by Glayce Kelly on 24/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    //MARK: - Outlet
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    //MARK: - Attributed
    var email: String = ""
    var password: String = ""
    var manager: RegisterManager = RegisterManager()
    var onCompleteUser: ((_ option: User) -> Void)?

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.text = email
        passwordTextField.text = password
    }
    
    //MARK: - Public methods
    
    static func getController() -> RegisterViewController? {
        if let viewController = UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController() as? RegisterViewController {
            return viewController
        }
        
        return nil
    }
    
    func registerCompletion(onComplete: @escaping(_ option: User) -> Void) {
        self.onCompleteUser = onComplete
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Actions
    
    @IBAction func registerAction(_ sender: UIButton) {
        guard let email: String = emailTextField.text else { return }
        guard let password: String = passwordTextField.text else { return }
        
        if let user: User = manager.registerUser(email: email, password: password) {
            self.onCompleteUser?(user)
//            dismiss(animated: true, completion: nil)
        } else {
            showAlert(message: "Verifique o e-mail e a senha!")
        }
    }
}
