//
//  YearViewModel.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import Foundation
import UIKit

class YearViewModel {
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var title: String {
        return "Year"
    }
    
    var getNumberOfRow: Int {
        return years.count
    }
    
    var years: [Anos] = []
    var brandSelected: Brand?
    var modelsSelected: Modelos?
    
    //*************************************************
    // MARK: - Private Properties
    //*************************************************
    
    private var service: YearServices
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(service: YearServices, brandSelected: Brand, modelsSelected: Modelos) {
        self.service = service
        self.brandSelected = brandSelected
        self.modelsSelected = modelsSelected
    }
}

//*************************************************
// MARK: - Public Methods
//*************************************************

extension YearViewModel {
    func loadYears(tableView: UITableView) {
        guard let brand: Brand = brandSelected else { return }
        guard let model: Modelos = modelsSelected else { return }
        
        self.service.loadYear(brandSelected: brand, modelSelected: model) { (result) in
            switch result {
            case .success(let years):
                self.years += years
                tableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
