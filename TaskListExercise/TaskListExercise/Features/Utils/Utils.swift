//
//  AlertController.swift
//  TaskListExercise
//
//  Created by Glayce Kelly on 17/12/20.
//

import Foundation
import UIKit

protocol UtilsDelegate {
    func didTouchEditTask(editedTask: String)
}

class Utils {
    
    static var shared: Utils = Utils()
    var delegate: UtilsDelegate?
    
    func openAlertCotroller(viewController: UIViewController?, title: String, message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let EditTaskAction = UIAlertAction(title: "Editar", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let editTextField = alertController.textFields![0] as UITextField
            print("Botão edit!!!")
            self.delegate?.didTouchEditTask(editedTask: editTextField.text ?? "")
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: {
                                            (action : UIAlertAction!) -> Void in
            print("Clicou no botão cancel!!!!")
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Edite sua tarefa"
        }
        
        alertController.addAction(EditTaskAction)
        alertController.addAction(cancelAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
}
