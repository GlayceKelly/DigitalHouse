//
//  BrandTableViewCell.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit

class BrandTableViewCell: UITableViewCell {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var nameBrandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//*************************************************
// MARK: - Public methods
//*************************************************

extension BrandTableViewCell {
    func prepareCell(with brand: Brand) {
        nameBrandLabel.text = brand.nome
    }
}
