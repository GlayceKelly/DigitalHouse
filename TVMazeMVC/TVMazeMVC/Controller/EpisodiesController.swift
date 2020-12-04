//
//  EpisodiesController.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 26/11/20.
//

import Foundation
import Alamofire

class EpisodiesController {
    
    //MARK:- Private properties
    
    var episodies: [Episodies?] = []
    
    //MARK:- Public properties
    
    var numberOfRows: Int {
        return episodies.count
    }
    
    //MARK:- Public methods
    
    func fetchEpisodies(id: Int, completion: @escaping (AFResult<[Episodies?]>) -> Void) {
        let basePath: String = "http://api.tvmaze.com/shows/\(id)/seasons"
        print(basePath)
        AF.request(basePath).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                    print(data)
                    let episodies: [Episodies] = try JSONDecoder().decode([Episodies].self, from: responseData)
                    self.episodies = episodies
                    completion(.success(episodies))
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
