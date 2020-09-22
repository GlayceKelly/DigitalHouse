//
//  ViewController.swift
//  DojoCalculadora
//
//  Created by Glayce Kelly on 03/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var lblResultado: UILabel!
    @IBOutlet weak var btnZero: UIButton!
    @IBOutlet weak var btnUm: UIButton!
    @IBOutlet weak var btnDois: UIButton!
    @IBOutlet weak var btnTres: UIButton!
    @IBOutlet weak var btnQuatro: UIButton!
    @IBOutlet weak var btnCinco: UIButton!
    @IBOutlet weak var btnSeis: UIButton!
    @IBOutlet weak var btnSete: UIButton!
    @IBOutlet weak var btnOito: UIButton!
    @IBOutlet weak var btnNove: UIButton!
    @IBOutlet weak var btnVirgula: UIButton!
    @IBOutlet weak var btnIgual: UIButton!
    @IBOutlet weak var btnSoma: UIButton!
    @IBOutlet weak var btnSubtracao: UIButton!
    @IBOutlet weak var btnmultiplicacao: UIButton!
    @IBOutlet weak var btnDivisao: UIButton!
    @IBOutlet weak var btnporcentagem: UIButton!
    @IBOutlet weak var btnLimpar: UIButton!
    
    // MARK:- Attributeds
    
    var primeiroNumero: String = ""
    var segundoNumero: String = ""
    var tipoOperacao: String = ""
    var operacaoClicado: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Arredondando os botoes
        btnUm.layer.cornerRadius = btnUm.frame.height / 2
        btnZero.layer.cornerRadius = btnZero.frame.height / 2
        btnDois.layer.cornerRadius = btnDois.frame.height / 2
        btnTres.layer.cornerRadius = btnTres.frame.height / 2
        btnQuatro.layer.cornerRadius = btnQuatro.frame.height / 2
        btnCinco.layer.cornerRadius = btnCinco.frame.height / 2
        btnSeis.layer.cornerRadius = btnSeis.frame.height / 2
        btnSete.layer.cornerRadius = btnSete.frame.height / 2
        btnOito.layer.cornerRadius = btnOito.frame.height / 2
        btnNove.layer.cornerRadius = btnNove.frame.height / 2
        btnVirgula.layer.cornerRadius = btnVirgula.frame.height / 2
        btnIgual.layer.cornerRadius = btnIgual.frame.height / 2
        btnSoma.layer.cornerRadius = btnSoma.frame.height / 2
        btnSubtracao.layer.cornerRadius = btnSubtracao.frame.height / 2
        btnmultiplicacao.layer.cornerRadius = btnmultiplicacao.frame.height / 2
        btnDivisao.layer.cornerRadius = btnDivisao.frame.height / 2
        btnporcentagem.layer.cornerRadius = btnporcentagem.frame.height / 2
        btnLimpar.layer.cornerRadius = btnLimpar.frame.height / 2
    }
    
    // MARK:- Methods
    
    func valorLabel(valor: String) {
        if let valorDigitado = lblResultado.text {
            if operacaoClicado {
                segundoNumero = valorDigitado + valor
            } else {
                primeiroNumero = valorDigitado + valor
            }
            
            lblResultado.text = valorDigitado + valor
        }
    }
    
    func defineTipoOperacao(operacao: String) {
        switch operacao {
        case "+", "-", "*", "/", "%":
            tipoOperacao = operacao
            operacaoClicado = true
            lblResultado.text = ""
        default:
            return
        }
    }
    
    func realizaCalculo() {
        var resultado: Int = 0
        let primeiro: Int = Int(primeiroNumero) ?? 0
        let segundo: Int = Int(segundoNumero) ?? 0
        
        switch tipoOperacao {
        case "+":
            resultado = primeiro + segundo
        case "-":
            resultado = primeiro - segundo
        case "*":
            resultado = primeiro * segundo
        case "/":
            if segundo != 0 {
                resultado = primeiro / segundo
            } else {
                print("Não é possível efetuar a divisão por zero")
            }
        case "%":
            resultado = ( primeiro * segundo ) / 100
        default:
            return
        }
        
        lblResultado.text = String(resultado)
        primeiroNumero = ""
        segundoNumero = ""
        operacaoClicado = false
    }

    
    // MARK:- Action numbers
    
    @IBAction func btnZero(_ sender: UIButton) {
        valorLabel(valor: "0")
    }
    
    @IBAction func btnUm(_ sender: UIButton) {
        valorLabel(valor: "1")
    }
    
    @IBAction func btnDois(_ sender: UIButton) {
        valorLabel(valor: "2")
    }
    
    @IBAction func btnTres(_ sender: UIButton) {
        valorLabel(valor: "3")
    }
    
    @IBAction func btnQuatro(_ sender: UIButton) {
        valorLabel(valor: "4")
    }
    
    @IBAction func btnCinco(_ sender: UIButton) {
        valorLabel(valor: "5")
    }
    
    @IBAction func btnSeis(_ sender: UIButton) {
        valorLabel(valor: "6")
    }
    
    @IBAction func btnSete(_ sender: UIButton) {
        valorLabel(valor: "7")
    }
    
    @IBAction func btnOito(_ sender: UIButton) {
        valorLabel(valor: "8")
    }
    
    @IBAction func btnNove(_ sender: UIButton) {
        valorLabel(valor: "9")
    }
    
    // MARK:- Action operations
    
    @IBAction func btnIgual(_ sender: UIButton) {
        realizaCalculo()
    }
    
    @IBAction func btnSoma(_ sender: UIButton) {
        defineTipoOperacao(operacao: "+")
    }
    
    @IBAction func btnSubtracao(_ sender: UIButton) {
        defineTipoOperacao(operacao: "-")
    }
    
    @IBAction func btnMultiplicacao(_ sender: UIButton) {
        defineTipoOperacao(operacao: "*")
    }
    
    @IBAction func btnDivisao(_ sender: UIButton) {
        defineTipoOperacao(operacao: "/")
    }
    
    @IBAction func btnPorcentagem(_ sender: UIButton) {
        defineTipoOperacao(operacao: "%")
    }
    
    @IBAction func btnLimpar(_ sender: UIButton) {
        lblResultado.text = ""
        primeiroNumero = ""
        segundoNumero = ""
    }
}

