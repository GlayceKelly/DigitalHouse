import UIKit

protocol Voador {
    func voar() -> Void
}

class Pato: Voador {
    var energia: Int = 10
    
    func voar() {
        energia = energia - 5
        print("Estou voando como um pato!")
    }
}

class Aviao: Voador {
    var horasDeVoo: Int = 20
    
    func voar() {
        horasDeVoo = horasDeVoo + 13
        print("Estou voando como um avião!")
    }
}

class SuperHomem: Voador {
    var experiencia: Int = 20
    
    func voar() {
        experiencia = experiencia + 3
        print("Estou voando como um campeão!")
    }
}

class TorreDeControle {
    var arrayVoadores = [Voador]()
    
    public func voamTodos() -> Void {
        for voador in arrayVoadores {
            print(voador.voar())
        }
    }
    
    public func adicionarVoador(umVoador: Voador) -> Void {
        arrayVoadores.append(umVoador)
    }
}

var pato: Pato = Pato()
var aviao: Aviao = Aviao()
var superHomem: SuperHomem = SuperHomem()

var torreDeControle: TorreDeControle = TorreDeControle()

torreDeControle.adicionarVoador(umVoador: pato)
torreDeControle.adicionarVoador(umVoador: aviao)
torreDeControle.adicionarVoador(umVoador: superHomem)

torreDeControle.voamTodos()
