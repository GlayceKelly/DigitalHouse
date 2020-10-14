//
//  ViewController.swift
//  Enum_SegmentedControl
//
//  Created by Glayce Kelly on 14/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

enum SchoolRule {
    static let student = 0
    static let professor = 1
    static let director = 2
}

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func changedSegmentControl(_ sender: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
    }
    
    @IBAction func actionShow(_ sender: UIButton) {
        switch segmentedControl.selectedSegmentIndex {
        case SchoolRule.student:
            print("Selecionado a opção ALUNOS")
        case SchoolRule.professor:
            print("Selecionado a opção PROFESSORES")
        case SchoolRule.director:
            print("Selecionado a opção DIRETORES")
        default:
            print("Opção inválida")
        }
    }
    
}

