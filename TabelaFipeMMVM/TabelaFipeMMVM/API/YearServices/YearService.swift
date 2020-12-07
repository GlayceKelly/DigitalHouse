//
//  YearService.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 06/12/20.
//

import Foundation
import Alamofire

protocol YearServicesProtocol: class {
    func loadYear(brandSelected: Brand?, modelSelected: Modelos?, completion: @escaping(AFResult<[Anos]>) -> Void)
}

class YearServices: YearServicesProtocol {
    
    func loadYear(brandSelected: Brand?, modelSelected: Modelos?, completion: @escaping (AFResult<[Anos]>) -> Void) {
        let brandCode: String = brandSelected?.codigo ?? ""
        let modelCode: Int = modelSelected?.codigo ?? 0
        let url = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandCode)/modelos/\(modelCode)/anos"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    
                    let years: [Anos] = try JSONDecoder().decode([Anos].self, from: responseData)
                    completion(.success(years))
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
