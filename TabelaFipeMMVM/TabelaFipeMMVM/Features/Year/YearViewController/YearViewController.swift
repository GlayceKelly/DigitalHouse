//
//  YearViewController.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit

class YearViewController: UIViewController {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var yearTableView: UITableView!
    
    //*************************************************
    // MARK: - Private properties
    //*************************************************
    
    private var viewModel: YearViewModel!
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(yearViewModel: YearViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = yearViewModel
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
        
        yearTableView.delegate = self
        yearTableView.dataSource = self

        loadYears()
    }
    
    //*************************************************
    // MARK: - Methods
    //*************************************************
    
    func loadYears() {
        viewModel.loadYears(tableView: yearTableView)
    }

}

//*************************************************
// MARK: - UITableViewDelegate
//*************************************************

extension YearViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let year: Anos = self.viewModel.years[indexPath.row]
        guard let brand: Brand = self.viewModel.brandSelected else { return }
        guard let model: Modelos = self.viewModel.modelsSelected else { return }
        
        let viewModel: CarViewModel = CarViewModel(carServices: CarServices(), yearSelected: year, brandSelected: brand, modelsSelected: model)
        let viewController: UIViewController = CarViewController(carViewModel: viewModel)
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//*************************************************
// MARK: - UITableViewDataSource
//*************************************************

extension YearViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("YearTableViewCell", owner: self, options: nil)?.first as! YearTableViewCell
        cell.prepareCell(with: viewModel.years[indexPath.row])
        
        return cell
    }
    
}
