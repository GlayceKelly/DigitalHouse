//
//  ModelViewController.swift
//  TabelaFipeMMVM
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit

class ModelViewController: UIViewController {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var modelTableView: UITableView!
    
    //*************************************************
    // MARK: - Private properties
    //*************************************************
    
    private var viewModel: ModelViewModel!
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(modelViewModel: ModelViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = modelViewModel
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
        
        modelTableView.delegate = self
        modelTableView.dataSource = self

        loadModels()
    }
    
    //*************************************************
    // MARK: - Methods
    //*************************************************
    
    func loadModels() {
        viewModel.loadModels(tableView: modelTableView)
    }
}

//*************************************************
// MARK: - UITableViewDelegate
//*************************************************

extension ModelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let brand = self.viewModel.brand else { return }
        let models = self.viewModel.modelos[indexPath.row]
        
        let viewModel: YearViewModel = YearViewModel(service: YearServices(), brandSelected: brand, modelsSelected: models)
        let viewController: UIViewController = YearViewController(yearViewModel: viewModel)
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//*************************************************
// MARK: - UITableViewDataSource
//*************************************************

extension ModelViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ModelTableViewCell", owner: self, options: nil)?.first as! ModelTableViewCell
        cell.prepareCell(with: viewModel.modelos[indexPath.row])
        
        return cell
    }
    
}
