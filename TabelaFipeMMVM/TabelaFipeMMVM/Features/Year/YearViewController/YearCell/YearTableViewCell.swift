//
//  YearTableViewCell.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit

class YearTableViewCell: UITableViewCell {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//*************************************************
// MARK: - Public methods
//*************************************************

extension YearTableViewCell {
    func prepareCell(with year: Anos) {
        yearLabel.text = year.nome
    }
}
