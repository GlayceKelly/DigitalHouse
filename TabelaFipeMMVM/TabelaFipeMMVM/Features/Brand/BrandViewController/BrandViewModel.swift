//
//  BrandViewModel.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import Foundation
import UIKit

class BrandViewModel {
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var title: String {
        return "Brand"
    }
    
    var getNumberOfRow: Int {
        return brands.count
    }
    
    var brands: [Brand] = []
    
    //*************************************************
    // MARK: - Private Properties
    //*************************************************

    private var service: BrandServices
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(service: BrandServices) {
        self.service = service
    }
}

//*************************************************
// MARK: - Public Methods
//*************************************************

extension BrandViewModel {
    
    func loadBrands(tableView: UITableView) {
        self.service.loadBrands { (result) in
            switch result  {
            case .success(let brands):
                self.brands += brands
                
                tableView.reloadData()
                
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
