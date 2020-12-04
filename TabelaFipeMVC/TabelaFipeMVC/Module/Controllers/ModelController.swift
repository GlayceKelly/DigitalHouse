//
//  ModelController.swift
//  TabelaFipeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import Foundation
import Alamofire

class ModelController: ControllerProtocol {
    var general: [General]?
    
    var brandSelected: Brand
    
    init(brand: Brand) {
        self.brandSelected = brand
    }
    
    var models: Model?
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        let url = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandSelected.codigo)/modelos"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    
                    self.models = try JSONDecoder().decode(Model.self, from: responseData)
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
        return models?.modelos.count ?? 0
    }
    
    func getNextController(index: Int) -> UIViewController {
        let controller = YearController(brand: brandSelected, modelSelected: models?.modelos[index])
        
        return DefaultListViewController.getView(controller: controller)
    }
    
    func getViewTitle() -> String {
        return brandSelected.nome
    }
    
    func getTitleForCell(at index: Int) -> String {
        return models?.modelos[index].nome ?? "Modelo não encontrado"
    }
    
    func getValueForCell(at index: Int) -> String {
        return ""
    }
    
    func getPlaceholderForSearchBar() -> String {
        return "Pesquise pelo modelo"
    }
    
    func getItemsList() -> [General]? {
        return nil
    }
}
