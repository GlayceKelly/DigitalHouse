//
//  CarController.swift
//  TabelaFipeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import Foundation
import Alamofire

class CarController: ControllerProtocol {
    
    var cars: Cars?
    
    var brandSelected: Brand
    var modelSelected: Modelos?
    var yearSelected: Anos?
    
    init(brandSelected: Brand, modelSelected: Modelos?, yearSelected: Anos?) {
        self.brandSelected = brandSelected
        self.modelSelected = modelSelected
        self.yearSelected = yearSelected
    }
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        guard let modelSelected: Int = modelSelected?.codigo else { return }
        guard let yearSelected: String = yearSelected?.codigo else { return }
        let url = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandSelected.codigo)/modelos/\(modelSelected)/anos/\(yearSelected)"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    print(data)
                    
                    self.cars = try JSONDecoder().decode(Cars.self, from: responseData)
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
        return 1
    }
    
    func getNextController(index: Int) -> UIViewController {
        return UIViewController()
    }
    
    func getViewTitle() -> String {
        return cars?.Modelo ?? "Detalhes do carro"
    }
    
    func getTitleForCell(at index: Int) -> String {
        let marca: String = cars?.Marca ?? "Marca não encontrada"
        let modelo: String = cars?.Modelo ?? "Modelo não encontrado"
        let title: String = "\(marca) - \(modelo): "
        return title
    }
    
    func getValueForCell(at index: Int) -> String {
        return cars?.Valor ?? "Valor não encontrado"
    }
    
    func getPlaceholderForSearchBar() -> String {
        return "Pesquise"
    }
    
    func getItemsList() -> [General]? {
        return nil
    }
    
    var general: [General]?
    
    
    
}
