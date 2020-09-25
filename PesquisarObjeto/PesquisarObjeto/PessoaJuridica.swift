//
//  PessoaJuridica.swift
//  PesquisarObjeto
//
//  Created by Glayce Kelly on 23/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import Foundation

class PessoaJuridica {
    var nome: String
    var cnpj: String
    
    init(nome: String, cnpj: String) {
        self.nome = nome
        self.cnpj = cnpj
    }
}
