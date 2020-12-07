//
//  BrandViewController.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit

class BrandViewController: UIViewController {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var brandTableView: UITableView!
    
    //*************************************************
    // MARK: - Private Properties
    //*************************************************
    
    private var viewModel: BrandViewModel!
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(brandViewModel: BrandViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = brandViewModel
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
        
        brandTableView.delegate = self
        brandTableView.dataSource = self

        loadBrands()
    }
    
    //*************************************************
    // MARK: - Methods
    //*************************************************
    
    func loadBrands() {
        viewModel.loadBrands(tableView: brandTableView)
    }

}

//*************************************************
// MARK: - UITableViewDelegate
//*************************************************

extension BrandViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel: ModelViewModel = ModelViewModel(service: ModelServices(), brand: self.viewModel.brands[indexPath.row])
        let viewController: UIViewController = ModelViewController(modelViewModel: viewModel)
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

//*************************************************
// MARK: - UITableViewDataSource
//*************************************************

extension BrandViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("BrandTableViewCell", owner: self, options: nil)?.first as! BrandTableViewCell
        cell.prepareCell(with: viewModel.brands[indexPath.row])
        
        return cell
    }
    
}
