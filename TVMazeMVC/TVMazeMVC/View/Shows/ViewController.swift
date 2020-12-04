//
//  ViewController.swift
//  TVMazeMVC
//
//  Created by Glayce Kelly on 19/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlets
   
    @IBOutlet private weak var showMoviesButton: UIButton!
    @IBOutlet private weak var moviesTableView: UITableView!
    
    //MARK:- Private Properties
    
    private var controller: ShowsController?
    
    //MARK:- Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller = ShowsController()
        
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        fetchShows()
    }

    //MARK:- Private methods
    
    private func fetchShows() {
        controller?.fetchShows(completion: { (result) in
            self.moviesTableView.reloadData()
        })
    }
    
    //MARK:- Actions
}

//MARK:- UITableViewDelegate

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = UIStoryboard(name: "Seasons", bundle: nil).instantiateInitialViewController() as! SeasonsViewController
        view.show = controller?.shows[indexPath.row]
        self.present(view, animated: true, completion: nil)
    }
}

//MARK:- UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ShowsTableViewCell", owner: self, options: nil)?.first as! ShowsTableViewCell
        
        guard let show: Shows = controller?.shows[indexPath.row] else { return UITableViewCell()}
        cell.prepareCell(with: show)
        return cell
    }
    
}

