import UIKit

class Funcionario {
    var nome: String
    var salario: Double
    var cpf: String
    
    init(nome: String, salario: Double, cpf: String) {
        self.nome = nome
        self.salario = salario
        self.cpf = cpf
    }
    
    func calculaBonus() -> Double {
        return 0.0
    }
}

class Programador: Funcionario {
    var plataformaTrabalho: String
    
    init(nome: String, salario: Double, cpf: String, plataformaTrabalho: String) {
        self.plataformaTrabalho = plataformaTrabalho
        super.init(nome: nome, salario: salario, cpf: cpf)
    }
    
    override func calculaBonus() -> Double {
        return ((salario * 20) / 100) + salario
    }
}

class Designer: Funcionario {
    var ferramentaPreferida: String
    
    init(nome: String, salario: Double, cpf: String, ferramentaPreferida: String) {
        self.ferramentaPreferida = ferramentaPreferida
        super.init(nome: nome, salario: salario, cpf: cpf)
    }
    
    override func calculaBonus() -> Double {
        return ((salario * 15) / 100) + salario
    }
}

var programador: Programador = Programador(nome: "Ariel", salario: 10000, cpf: "12345678", plataformaTrabalho: "Android")
print("Nome Programador: \(programador.nome). Salario: \(programador.calculaBonus())")

var designer: Designer = Designer(nome: "Picasso", salario: 8000, cpf: "123456", ferramentaPreferida: "Photoshop")
print("Nome Designer: \(designer.nome). Salario: \(designer.calculaBonus())")
