//
//  ViewController.swift
//  CollectionViewCars
//
//  Created by Glayce Kelly on 07/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
    // MARK: - Outlets
    
    @IBOutlet weak var collectionViewCars: UICollectionView!
    
    // MARK: - Attributes
    
    var cars: [Cars] = [Cars]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars.append(Cars(name: "Audi", image: "carros1"))
        cars.append(Cars(name: "Honda", image: "carros2"))
        cars.append(Cars(name: "Renault", image: "carros3"))
        cars.append(Cars(name: "Fiat", image: "carros4"))
        
        collectionViewCars.delegate = self
        collectionViewCars.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewCars.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellCars", for: indexPath) as! CollectionViewCellCars
        
        cell.setup(car: cars[indexPath.row])
        
        return cell
    }
}

