//
//  ViewController.swift
//  2509_TableViewCars
//
//  Created by Glayce Kelly on 25/09/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var carsTableView: UITableView!
    @IBOutlet weak var selectedCarLabel: UILabel!
    
    // MARK: - Attibutes
    
    var cars: [String] = ["Fiat", "Honda", "Renault", "BMW", "Audi"]

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carsTableView.delegate = self
        carsTableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCarLabel.text = cars[indexPath.row]
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = cars[indexPath.row]
        cell.imageView?.image = UIImage(named: "carro.png")
        
        return cell
    }
}
