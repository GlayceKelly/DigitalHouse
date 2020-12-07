//
//  CarsTableViewCell.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var nameCarLabel: UILabel!
    @IBOutlet weak var detailCarLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//*************************************************
// MARK: - Public methods
//*************************************************

extension CarsTableViewCell {
    func prepareCell(with car: Cars) {
        nameCarLabel.text = "\(car.Modelo) - \(car.AnoModelo)"
        detailCarLabel.text = "\(car.Valor)"
    }
}
