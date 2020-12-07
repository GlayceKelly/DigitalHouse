//
//  ModelService.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import Foundation
import Alamofire

protocol ModelServicesProtocol: class {
    func loadModel(codigo: String, completion: @escaping(AFResult<Model>) -> Void)
}

class ModelServices: ModelServicesProtocol {
    
    func loadModel(codigo: String, completion: @escaping (AFResult<Model>) -> Void) {
        let url = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(codigo)/modelos"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    
                    let model: Model = try JSONDecoder().decode(Model.self, from: responseData)
                    completion(.success(model))
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
