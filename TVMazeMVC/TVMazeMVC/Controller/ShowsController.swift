//
//  ShowsController.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 19/11/20.
//

import Foundation
import Alamofire

class ShowsController {
    
    //MARK:- Private properties
    
    var shows: [Shows?] = []
    
    //MARK:- Public properties
    
    var numberOfRows: Int {
        return shows.count
    }
    
    //MARK:- Public methods
    
    func fetchShows(completion: @escaping (AFResult<[Shows?]>) -> Void) {
        let basePath: String = "http://api.tvmaze.com/shows?page=1"
        
        AF.request(basePath).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let responseData = response.data else { return }
                
                    let shows: [Shows] = try JSONDecoder().decode([Shows].self, from: responseData)
                    self.shows = shows
                    completion(.success(shows))
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
