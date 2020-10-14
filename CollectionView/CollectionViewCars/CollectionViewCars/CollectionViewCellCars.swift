//
//  CollectionViewCellCars.swift
//  CollectionViewCars
//
//  Created by Glayce Kelly on 07/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class CollectionViewCellCars: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var nameCarLabel: UILabel!
    
    // MARK: - Public methods
    
    func setup(car: Cars) {
        carImageView.image = UIImage(named: car.image)
        carImageView.layer.cornerRadius = carImageView.frame.width / 2
        carImageView.contentMode = .scaleAspectFill
        
        nameCarLabel.text = car.name
    }
}
