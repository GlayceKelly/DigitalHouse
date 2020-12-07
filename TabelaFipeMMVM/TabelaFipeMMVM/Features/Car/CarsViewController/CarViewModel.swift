//
//  CarViewModel.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import Foundation
import UIKit

class CarViewModel {
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var title: String {
        return "Cars"
    }
    
    var getNumberOfRow: Int {
        return 1
    }
    
    var cars: Cars?
    var yearSelected: Anos?
    var brandSelected: Brand?
    var modelsSelected: Modelos?
    
    //*************************************************
    // MARK: - Private Properties
    //*************************************************

    private var carServices: CarServices
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(carServices: CarServices, yearSelected: Anos, brandSelected: Brand, modelsSelected: Modelos) {
        self.carServices = carServices
        self.yearSelected = yearSelected
        self.brandSelected = brandSelected
        self.modelsSelected = modelsSelected
    }
}

//*************************************************
// MARK: - Public Methods
//*************************************************

extension CarViewModel {
    
    func loadCars(tableView: UITableView) {
        self.carServices.loadCars(brandSelected: brandSelected, modelSelected: modelsSelected, yearSelected: yearSelected) { (result) in
            switch result {
            case .success(let cars):
                self.cars = cars
                tableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
