//
//  EpisodiesViewController.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 25/11/20.
//

import UIKit

class EpisodiesViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var showImageView: UIImageView!
    @IBOutlet private weak var episodiesTableView: UITableView!
    
    //MARK:- Public Properties
    
    var season: Seasons?
    var episodies: Episodies?
    
    //MARK:- Private Properties
    
    private var controller: EpisodiesController?
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller = EpisodiesController()
        
        episodiesTableView.delegate = self
        episodiesTableView.dataSource = self
        
        fetchEpisodies()

    }
    
    //MARK:- Private methods
    
    private func fetchEpisodies() {
        controller?.fetchEpisodies(id: season?.id ?? 0, completion: { (result) in
            self.episodiesTableView.reloadData()
        })
    }


}

extension EpisodiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selecionou o elemento \(indexPath.row)")
    }
}

extension EpisodiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = controller?.episodies[indexPath.row]?.name
        cell.detailTextLabel?.text = controller?.episodies[indexPath.row]?.summary
        
        return cell
    }
}
