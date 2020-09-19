import UIKit

class Pessoa {
    
    // Atributos
    
    var nome: String
    var idade: String
    var cpf: String
    var endereco: String
    var email: String
    var telefone: String
    
    // Construtor (init)
    
    init(nome: String, idade: String, cpf: String, endereco: String, email: String, telefone: String) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.endereco = endereco
        self.email = email
        self.telefone = telefone
    }
    
    // Metodos
    
    func cadastrarPessoa() {
        print("Pessoa cadastrada")
    }
    
    func atualizarCadastro() {
        print("Cadastro atualizado")
    }
    
    func excluirCadastroPessoa() {
        print("Cadastro excluido")
    }
}

class Funcionario: Pessoa {
    
    // Atributos
    
    var cargo: String
    var franquia: String
    var salario: String
    
    // Construtor (init)
    
    init(nome: String, idade: String, cpf: String, endereco: String, email: String, telefone: String, cargo: String, franquia: String, salario: String) {
        self.cargo = cargo
        self.franquia = franquia
        self.salario = salario
        super.init(nome: nome, idade: idade, cpf: cpf, endereco: endereco, email: email, telefone: telefone)
    }
    
    // Metodos
    
    func receberSalario() {
        print("Salario recebido!")
    }
    
    func definirTurno() {
        print("Turno definido!")
    }
    
    func definirFolga() {
        print("Folga definida!")
    }
    
    func organizarEstoque() {
        print("Estoque organizado!")
    }
}

class Cliente: Pessoa {
    
    // Atributos
    
    var numeroCartao: String
    var codigoDaCompra: String
    var formaDePagamento: String
    
    // Construtor (init)
    
    init(nome: String, idade: String, cpf: String, endereco: String, email: String, telefone: String, numeroCartao: String, codigoDaCompra: String, formaDePagamento: String) {
        self.numeroCartao = numeroCartao
        self.codigoDaCompra = codigoDaCompra
        self.formaDePagamento = formaDePagamento
        super.init(nome: nome, idade: idade, cpf: cpf, endereco: endereco, email: email, telefone: telefone)
    }
    
    // Metodos
    
    func efetuarPagamento() {
        print("Pagamento efetuado!")
    }
    
    func fazerPedido() {
        print("Pedido feito!")
    }
    
    func consultarProduto() {
        print("Produto consultado com sucesso!")
    }
}
