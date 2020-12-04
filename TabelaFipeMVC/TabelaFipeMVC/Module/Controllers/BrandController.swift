//
//  BrandController.swift
//  TabelaFipeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import Foundation
import Alamofire

class BrandController: ControllerProtocol {
    var general: [General]?
    
    var brands: [Brand] = []
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        let url: String = "https://parallelum.com.br/fipe/api/v1/carros/marcas"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    
                    self.brands = try JSONDecoder().decode([Brand].self, from: responseData)
                    self.general = self.brands
                    onComplete(true)
                } catch {
                    print(error.localizedDescription)
                    onComplete(false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                onComplete(false)
            }
        }
    }
    
    func getNumberOfRow() -> Int {
        return brands.count
    }
    
    func getNextController(index: Int) -> UIViewController {
        let controller = ModelController(brand: brands[index])
        
        return DefaultListViewController.getView(controller: controller)
    }
    
    func getViewTitle() -> String {
        return "Marcas"
    }
    
    func getTitleForCell(at index: Int) -> String {
        let name = brands[index].nome
        return name
    }
    
    func getValueForCell(at index: Int) -> String {
        return ""
    }
    
    func getPlaceholderForSearchBar() -> String {
        return "Pesquise pela marca"
    }
    
    func getItemsList() -> [General]? {
        return brands
    }
}
