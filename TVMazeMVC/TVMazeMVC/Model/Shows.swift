//
//  GeneralMovies.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 19/11/20.
//

import Foundation

struct Shows: Codable {
    let id: Int
    let name: String
    let image: Image
    let genres: [String]
    let network: Network?
    let webChannel: WebChannel?
}

struct Image: Codable {
    let medium: String
    let original: String
}

struct Network: Codable {
    let id: Int
    let name: String
}

struct WebChannel: Codable {
    let id: Int
    let name: String
}
