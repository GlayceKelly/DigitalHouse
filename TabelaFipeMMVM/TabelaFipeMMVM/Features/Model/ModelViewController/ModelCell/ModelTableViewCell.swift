//
//  ModelTableViewCell.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit

class ModelTableViewCell: UITableViewCell {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var nameModelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//*************************************************
// MARK: - Public methods
//*************************************************

extension ModelTableViewCell {
    func prepareCell(with model: Modelos) {
        nameModelLabel.text = model.nome
    }
}
