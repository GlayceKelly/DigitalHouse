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
//        print(datePicker.date)
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let dateDescription: String = dateFormatter.string(from: datePicker.date)
        print(dateDescription)
    }
}

