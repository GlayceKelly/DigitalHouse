//
//  ViewController.swift
//  Closure
//
//  Created by Glayce Kelly on 20/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var optionSelectedLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    
    @IBAction func openOptionsViewAction(_ sender: UIButton) {
        if let viewOption = OptionViewController.getController() {
            viewOption.setOptionCompletion { (option) in
                self.optionSelectedLabel.text = "Opção selecionada: \(option)"
            }
            
            viewOption.setColorCompletion { (color) in
                self.view.backgroundColor = color
            }
            
            present(viewOption, animated: true, completion: nil)
        }
    }
}
