//
//  SeasonsController.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import Foundation
import Alamofire

class SeasonsController {
    
    //MARK:- Private properties
    
    var seasons: [Seasons?] = []
    
    //MARK:- Public properties
    
    var numberOfRows: Int {
        return seasons.count
    }
    
    //MARK:- Public methods
    
    func fetchSeasons(id: Int, completion: @escaping (AFResult<[Seasons?]>) -> Void) {
        let basePath: String = "http://api.tvmaze.com/shows/\(id)/seasons"
        print(basePath)
        AF.request(basePath).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    print(data)
                    let seasons: [Seasons] = try JSONDecoder().decode([Seasons].self, from: responseData)
                    self.seasons = seasons
                    completion(.success(seasons))
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
