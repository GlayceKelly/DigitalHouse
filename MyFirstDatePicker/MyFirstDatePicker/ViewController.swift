//
//  ViewController.swift
//  MyFirstDatePicker
//
//  Created by Glayce Kelly on 14/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        print(datePicker.date)
    }
}

