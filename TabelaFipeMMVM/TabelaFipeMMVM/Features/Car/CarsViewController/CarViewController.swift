//
//  CarViewController.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit

class CarViewController: UIViewController {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var carTableView: UITableView!
    
    //*************************************************
    // MARK: - Private Properties
    //*************************************************
    
    private var viewModel: CarViewModel!
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(carViewModel: CarViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = carViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //*************************************************
    // MARK: - Lifecycle
    //*************************************************

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title

        carTableView.dataSource = self
        
        loadCars()
    }
    
    //*************************************************
    // MARK: - Methods
    //*************************************************
    
    func loadCars() {
        viewModel.loadCars(tableView: carTableView)
    }
}

//*************************************************
// MARK: - UITableViewDataSource
//*************************************************

extension CarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CarsTableViewCell", owner: self, options: nil)?.first as! CarsTableViewCell
        guard let cars: Cars = self.viewModel.cars else { return UITableViewCell()}
        cell.prepareCell(with: cars)
        
        return cell
    }
    
}
