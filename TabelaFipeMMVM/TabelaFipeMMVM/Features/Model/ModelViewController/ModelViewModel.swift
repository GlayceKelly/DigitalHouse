//
//  ModelViewModel.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import Foundation
import UIKit

class ModelViewModel {
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var title: String {
        return "Model"
    }
    
    var getNumberOfRow: Int {
        return modelos.count
    }
    
    var brand: Brand?
    var modelos: [Modelos] = []
    
    //*************************************************
    // MARK: - Private Properties
    //*************************************************
    
    private var service: ModelServices
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(service: ModelServices, brand: Brand) {
        self.service = service
        self.brand = brand
    }
}

//*************************************************
// MARK: - Public Methods
//*************************************************

extension ModelViewModel {
    func loadModels(tableView: UITableView) {
        self.service.loadModel(codigo: brand?.codigo ?? "") { (result) in
            switch result  {
            case .success(let model):
                self.modelos += model.modelos
                
                tableView.reloadData()
                
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
