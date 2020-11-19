//
//  Models.swift
//  TVMaze
//
//  Created by Glayce Kelly on 13/11/20.
//

import Foundation

// MARK: - BaseModelElement
struct BaseModelElement: Codable {
    let id: Int
    let url: String
    let name: String
    let type: String
    let language: Language
    let genres: [String]
    let status: Status
    let runtime: Int?
    let premiered: String?
    let officialSite: String?
    let schedule: Schedule
    let rating: Rating
    let weight: Int
    let network, webChannel: Network?
    let externals: Externals
    let image: Image
    let summary: String
    let updated: Int
    let links: Links
}

// MARK: - Externals
struct Externals: Codable {
    let tvrage: Int
    let thetvdb: Int?
    let imdb: String?
}

// MARK: - Image
struct Image: Codable {
    let medium, original: String
}

enum Language: Codable {
    case english
    case japanese
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: Nextepisode
    let previousepisode, nextepisode: Nextepisode?
}

// MARK: - Nextepisode
struct Nextepisode: Codable {
    let href: String
}

// MARK: - Network
struct Network: Codable {
    let id: Int
    let name: String
    let country: Country?
}

// MARK: - Country
struct Country: Codable {
    let name: Name
    let code: Code
    let timezone: Timezone
}

enum Code: Codable {
    case ca
    case fr
    case gb
    case jp
    case us
}

enum Name: Codable {
    case canada
    case france
    case japan
    case unitedKingdom
    case unitedStates
}

enum Timezone: Codable {
    case americaHalifax
    case americaNewYork
    case asiaTokyo
    case europeLondon
    case europeParis
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double?
}

// MARK: - Schedule
struct Schedule: Codable {
    let time: String
    let days: [Day]
}

enum Day: Codable {
    case friday
    case monday
    case saturday
    case sunday
    case thursday
    case tuesday
    case wednesday
}

enum Status: Codable {
    case ended
    case running
    case toBeDetermined
}

enum TypeEnum: Codable {
    case animation
    case documentary
    case news
    case panelShow
    case reality
    case scripted
    case sports
    case talkShow
    case variety
}
