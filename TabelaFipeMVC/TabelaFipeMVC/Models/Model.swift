//
//  Model.swift
//  TabelaFipeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import Foundation

struct Model: Codable {
    let modelos: [Modelos]
    let anos: [Anos]
}

struct Modelos: Codable {
    let nome: String
    let codigo: Int
}

struct Anos: Codable {
    let nome: String
    let codigo: String
}
