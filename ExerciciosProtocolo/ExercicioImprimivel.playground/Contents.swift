import UIKit

protocol ImprimivelProtocol {
    func imprimir() -> Void
}

class Contrato: ImprimivelProtocol {
    func imprimir() {
        print("Sou um contrato muito legal!")
    }
}

class Foto: ImprimivelProtocol {
    func imprimir() {
        print("Sou uma selfie")
    }
}

class Documento: ImprimivelProtocol {
    func imprimir() {
        print("Sou um documento do Word!")
    }
}

class Impressora {
    var imprimiveis = [ImprimivelProtocol]()
    
    public func imprimirTudo() -> Void {
        for imprimivel in imprimiveis {
            print(imprimivel.imprimir())
        }
    }
    
    public func agregarImprimível(umImprimível: ImprimivelProtocol) -> Void {
        imprimiveis.append(umImprimível)
    }
}

var impressora: Impressora = Impressora()

var contrato: Contrato = Contrato()
var foto: Foto = Foto()
var documento: Documento = Documento()

impressora.agregarImprimível(umImprimível: contrato)
impressora.agregarImprimível(umImprimível: foto)
impressora.agregarImprimível(umImprimível: documento)

impressora.imprimirTudo()
