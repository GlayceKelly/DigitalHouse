//
//  ItemCompraManager.swift
//  ListasDeCompras
//
//  Created by Glayce Kelly on 16/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import Foundation

class ItemCompraManager {
    
    //MARK:- Atributos
    
    var itemsCompra: [ItemCompra] = [ItemCompra]()
    
    //MARK:- Funcoes
    
    func registerItem(name: String, quantity: Int) {
        if isValidData(name: name, quantity: quantity) {
            if isItemRegister(name: name) {
                updateItem(name: name, quantity: quantity)
            } else {
                let item: ItemCompra = ItemCompra(name: name, quantity: quantity)
                itemsCompra.append(item)
                
                print("Item cadastrado")
            }
        }
    }
    
    func removeItem(name: String) {
        if isItemRegister(name: name) {
            if let item: ItemCompra = getItemWithName(name: name) {
                if let index = itemsCompra.firstIndex(where: {$0 === item}) {
                    itemsCompra.remove(at: index)
                }
            }
        }
    }
    
    func updateItem(name: String, quantity: Int) {
        if isItemRegister(name: name) {
            if let item: ItemCompra = getItemWithName(name: name) {
                item.quantity = quantity
            }
        }
    }
    
    func getItemsName() -> String {
        var name: String = ""
        for item in itemsCompra {
            name += "\(item.name) \n"
        }

        return name
    }
    
    func getItemWithName(name: String) -> ItemCompra? {
        for item in itemsCompra {
            if item.name.folding(options: .diacriticInsensitive, locale: .current).lowercased()
                == name.folding(options: .diacriticInsensitive, locale: .current).lowercased() {
                return item
            }
        }
        
        return nil
    }
    
    func isItemRegister(name: String) -> Bool {
        for item in itemsCompra {
            if item.name == name {
                return true
            }
        }

        return false
    }
    
    private func isValidData(name: String, quantity: Int) -> Bool {
        return name != "" && quantity > 0
    }
}
