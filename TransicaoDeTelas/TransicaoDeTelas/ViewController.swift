//
//  ViewController.swift
//  TransicaoDeTelas
//
//  Created by Glayce Kelly on 21/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    
    @IBAction func actionViewOne(_ sender: UIButton) {
        if let viewOne = UIStoryboard(name: "MyViewOneStoryboard", bundle: nil).instantiateInitialViewController() as? MyOneViewController {
            // Modal
            
            // Navigation
            navigationController?.pushViewController(viewOne, animated: true)
        }
    }
    
    @IBAction func actionViewTwo(_ sender: UIButton) {
    }
    
    @IBAction func actionViewThree(_ sender: UIButton) {
    }
    
    @IBAction func actionViewFour(_ sender: UIButton) {
    }
    
    @IBAction func actionFive(_ sender: UIButton) {
    }
    
    @IBAction func actionViewSix(_ sender: UIButton) {
    }
    
    @IBAction func actionViewSeven(_ sender: UIButton) {
    }
    
    @IBAction func actionViewEight(_ sender: UIButton) {
    }
    
    @IBAction func actionViewNine(_ sender: UIButton) {
    }
    
}

