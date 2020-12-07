//
//  CarServices.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import Foundation
import Alamofire

protocol CarServiceProtocol: class {
    func loadCars(brandSelected: Brand?, modelSelected: Modelos?, yearSelected: Anos?, completion: @escaping(AFResult<Cars>) -> Void)
}

class CarServices: CarServiceProtocol {
    func loadCars(brandSelected: Brand?, modelSelected: Modelos?, yearSelected: Anos?, completion: @escaping (AFResult<Cars>) -> Void) {
        guard let brandCode: String = brandSelected?.codigo else { return }
        guard let modelCode: Int = modelSelected?.codigo else { return }
        guard let yearCode: String = yearSelected?.codigo else { return }
        
        let url: String = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandCode)/modelos/\(modelCode)/anos/\(yearCode)"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    
                    let cars: Cars = try JSONDecoder().decode(Cars.self, from: responseData)
                    completion(.success(cars))
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
