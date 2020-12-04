//
//  SeasonsViewController.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import UIKit

class SeasonsViewController: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet private weak var showImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var seasonsTableView: UITableView!
    
    //MARK:- Public Properties
    
    var show: Shows?
    
    //MARK:- Private Properties
    
    private var controller: SeasonsController?
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller = SeasonsController()
        
        seasonsTableView.delegate = self
        seasonsTableView.dataSource = self
        
        setupUI()
        
        fetchSeasons()
    }
    
    //MARK:- Private methods
    
    private func fetchSeasons() {
        controller?.fetchSeasons(id: show?.id ?? 0, completion: { (result) in
            self.seasonsTableView.reloadData()
        })
    }
    
    private func setupUI() {
        setupLabel()
        setupImageView()
    }
    
    private func setupLabel() {
        nameLabel.text = show?.name
    }
    
    private func setupImageView() {
        let url = URL(string: show?.image.medium ?? "")
        showImageView.kf.setImage(with: url)
    }

}

//MARK:- UITableViewDelegate

extension SeasonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController: EpisodiesViewController = EpisodiesViewController()
        viewController.season = controller?.seasons[indexPath.row]
        self.present(viewController, animated: true, completion: nil)
    }
    
}

//MARK:- UITableViewDataSource

extension SeasonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let name: String = controller?.seasons[indexPath.row]?.name ?? ""
        var nameFormatted: String = ""
        
        if name.uppercased() == "" {
            nameFormatted = "Season \(controller?.seasons[indexPath.row]?.number ?? 0)"
        } else {
            nameFormatted = name
        }
        
        cell.textLabel?.text = nameFormatted
        
        return cell
    }

}
