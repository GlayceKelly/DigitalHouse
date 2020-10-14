//
//  ViewController.swift
//  05102020_IBOutletIBAction
//
//  Created by Glayce Kelly on 05/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel?
    @IBOutlet var button: UIButton?
    @IBOutlet var textField: UITextField?
    @IBOutlet var searchBar: UISearchBar?
    @IBOutlet var image: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionButton(sender: UIButton) {
        print("clique!!!")
    }


}

