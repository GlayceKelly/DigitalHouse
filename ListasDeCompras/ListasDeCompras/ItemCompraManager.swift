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
    var name: String = ""
    
    //MARK:- Funcoes
    
    //cadastrar item
    func createItem(name: String, quantity: Int) {
        //ja existe item?
        if verifyItem() {
            for item in itemsCompra {
                //se existir item, deve atualizar a quantidade
                if item.name == name {
                    item.quantity = quantity
                } else {
                    let item: ItemCompra = ItemCompra(name: name, quantity: quantity)
                    itemsCompra.append(item)
                    
                    print(item.name)
                    print(item.quantity)
                }
            }
        } else {
            //se nao existir, cadastrar nome e quantidade
            let item: ItemCompra = ItemCompra(name: name, quantity: quantity)
            itemsCompra.append(item)
            
            print(item.name)
            print(item.quantity)
        }
        
        print(itemsCompra.count)
    }
    
    //editar item
    func editItem(name: String, quantity: Int) {
        //ja existe item?
        if verifyItem() {
            //se existir, editar
            for item in itemsCompra {
                item.name = name
                item.quantity = quantity
            }
        }
    }
    
    
    //remover item
    func removeItem(name: String) {
        //ja existe item?
        if verifyItem() {
            //se existir, remover
//            itemsCompra = itemsCompra.filter(){$0 != name}
//
//            if let index = itemsCompra.firstIndex(of: "chimps") {
//                itemsCompra.remove(at: index)
//            }
//            print(itemsCompra)
        }
    }
    
    
    //verificar se existe item na lista
    func verifyItem() -> Bool {
        return itemsCompra.count > 0
    }
    
    //retornar itens existentes
    func getItems(name: String) -> String {
        for item in itemsCompra {
            self.name += "\(item.name) \n"
        }
        
        return self.name
    }
}
