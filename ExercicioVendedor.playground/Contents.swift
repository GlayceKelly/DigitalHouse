import UIKit

class Vendedor {
    private var nome: String
    private var idade: Int
    private var cpf: String
    private var saldoEmConta: Double
    var bone: String = "bone"
    var vestido: String = "vestido"
    var terno: String = "terno"
    
    init(nome: String, idade: Int, cpf: String, saldoEmConta: Double) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.saldoEmConta = saldoEmConta
    }
    
    func getNome() -> String {
        return nome
    }
    
    func setNome(nome: String) {
        self.nome = nome
    }
    
    func getIdade() -> Int {
        return idade
    }
    
    func setIdade(idade: Int) {
        self.idade = idade
    }
    
    func getCpf() -> String {
        return cpf
    }
    
    func setCpf(cpf: String) {
        self.cpf = cpf
    }
    
    func getSaldoEmConta() -> Double {
        return saldoEmConta
    }
    
    func vender(quantidadeDePecas: Int, tipoDePeca: String) {
        if tipoDePeca == terno {
            if quantidadeDePecas >= 3 {
                saldoEmConta += Double(350 * quantidadeDePecas)
            } else {
                saldoEmConta += Double(400 * quantidadeDePecas)
            }
        } else if tipoDePeca == bone {
            if quantidadeDePecas >= 2 {
                saldoEmConta += Double(50 * 2)
            } else {
                saldoEmConta += Double(50 * quantidadeDePecas)
            }
        } else if tipoDePeca == vestido {
            if quantidadeDePecas >= 5 {
                saldoEmConta += Double((900 * quantidadeDePecas) - 250)
            } else {
                saldoEmConta += Double(900 * quantidadeDePecas)
            }
        }
    }
}
