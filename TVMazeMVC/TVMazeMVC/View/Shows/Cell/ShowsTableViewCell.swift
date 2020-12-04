//
//  MoviesTableViewCell.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 19/11/20.
//

import UIKit
import Kingfisher

class ShowsTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
     
    @IBOutlet private weak var showImageView: UIImageView!
    @IBOutlet private weak var showNameLabel: UILabel!
    @IBOutlet private weak var showGenresLabel: UILabel!
    @IBOutlet private weak var showNetworkNameLabel: UILabel!
    @IBOutlet private weak var showWebChannelNameLabel: UILabel!
    
    //MARK: - Private properties
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

//*************************************************
// MARK: - Public methods
//*************************************************

extension ShowsTableViewCell {
    func prepareCell(with show: Shows) {
        var genre: String = ""
        
        showNameLabel.text = show.name
        
        for item in show.genres {
            genre.append("\(item) - ")
        }
        
        showGenresLabel.text = genre
        showNetworkNameLabel.text = show.network?.name
        showWebChannelNameLabel.text = show.webChannel?.name
        
        let url = URL(string: show.image.medium)
        showImageView.kf.setImage(with: url)
    }
}
