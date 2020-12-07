//
//  BrandServices.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import Foundation

import Alamofire

protocol BrandServicesProtocol: class {
    func loadBrands(completion: @escaping(AFResult<[Brand]>) -> Void)
}

class BrandServices: BrandServicesProtocol {
    func loadBrands(completion: @escaping (AFResult<[Brand]>) -> Void) {
        let url: String = "https://parallelum.com.br/fipe/api/v1/carros/marcas"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    
                    let brands: [Brand] = try JSONDecoder().decode([Brand].self, from: responseData)
                    completion(.success(brands))
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
