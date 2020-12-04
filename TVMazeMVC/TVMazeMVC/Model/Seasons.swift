//
//  Seasons.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

//Listar Shows http://api.tvmaze.com/shows?page=1
//Listar temporadas http://api.tvmaze.com/shows/250/seasons
//Listar episódios da temporada http://api.tvmaze.com/seasons/987/episodes

import Foundation

struct Seasons: Codable {
    let id: Int?
    let number: Int?
    let name: String?
}
