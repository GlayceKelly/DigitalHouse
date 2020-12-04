//
//  YearController.swift
//  TabelaFipeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import Foundation
import Alamofire

class YearController: ControllerProtocol {
    
    var anos: [Anos]?
    
    var brandSelected: Brand
    var modelSelected: Modelos?
    
    init(brand: Brand, modelSelected: Modelos?) {
        self.brandSelected = brand
        self.modelSelected = modelSelected
    }
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        guard let modelSelected: Int = modelSelected?.codigo else { return }
        let url = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandSelected.codigo)/modelos/\(modelSelected)/anos"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    
                    self.anos = try JSONDecoder().decode([Anos].self, from: responseData)
                    onComplete(true)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
                onComplete(false)
            }
        }
    }
    
    func getNumberOfRow() -> Int {
        return anos?.count ?? 0
    }
    
    func getNextController(index: Int) -> UIViewController {
        let controller: CarController = CarController(brandSelected: brandSelected, modelSelected: modelSelected, yearSelected: anos?[index])
        
        return DefaultListViewController.getView(controller: controller)
    }
    
    func getViewTitle() -> String {
        return modelSelected?.nome ?? "Anos"
    }
    
    func getTitleForCell(at index: Int) -> String {
        return anos?[index].nome ?? "Nada encontrado"
    }
    
    func getValueForCell(at index: Int) -> String {
        return ""
    }
    
    func getPlaceholderForSearchBar() -> String {
        return "Pesquise pelo ano"
    }
    
    func getItemsList() -> [General]? {
        return nil
    }
    
    var general: [General]?
    
}
