//
//  ViewController.swift
//  ListasDeCompras
//
//  Created by Glayce Kelly on 16/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldQuantity: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productListLabel: UILabel!
    
    //MARK:- Atributos
    
    private var itemManager: ItemCompraManager = ItemCompraManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFieldName.delegate = self
    }

    //MARK:- Actions
    
    @IBAction func saveItem(_ sender: UIButton) {
        guard let name = textFieldName.text else { return }
        guard let quantity = Int(textFieldQuantity.text ?? "") else { return }
        
        itemManager.registerItem(name: name, quantity: quantity)
        productListLabel.text = itemManager.getItemsName()
        clean()
    }
    
    @IBAction func cleanItem(_ sender: UIButton) {
        clean()
    }
    
    @IBAction func removeITem(_ sender: UIButton) {
        guard let name = textFieldName.text else { return }
        
        itemManager.removeItem(name: name)
        productListLabel.text = itemManager.getItemsName()
        clean()
    }
    
    //MARK:- Funcoes
    
    func clean() {
        textFieldName.text = ""
        textFieldQuantity.text = ""
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let name = textFieldName.text else { return }
        
        if itemManager.isItemRegister(name: name) {
            if let item: ItemCompra = itemManager.getItemWithName(name: name) {
                textFieldQuantity.text = "\(item.quantity)"
                
                titleLabel.text = "Produto já existente"
            }
        }
        
        titleLabel.text = "Produto novo"
    }
}
