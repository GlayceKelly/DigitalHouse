//
//  DefaultListViewController.swift
//  TabelaFipeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import UIKit

class DefaultListViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet private weak var defaultTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    //MARK: - Properties
    
    var controller: ControllerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultTableView.delegate = self
        defaultTableView.dataSource = self
        searchBar.delegate = self

        title = controller.getViewTitle()
        searchBar.placeholder = controller.getPlaceholderForSearchBar()
        
        loadData()
    }
    
    func loadData() {
        controller.loadData { (isSuccess) in
            self.defaultTableView.reloadData()
        }
    }
    
    class func getView(controller: ControllerProtocol) -> DefaultListViewController {
        let viewDefault = UIStoryboard(name: "DefaultListViewController", bundle: nil).instantiateInitialViewController() as! DefaultListViewController
        viewDefault.controller = controller
        return viewDefault
    }
}

extension DefaultListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getNumberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = controller.getTitleForCell(at: indexPath.row)
        cell.detailTextLabel?.text = controller.getValueForCell(at: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = controller.getNextController(index: indexPath.row)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DefaultListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let term: String = searchBar.text else { return }
        controller.general = getFilter(term: term) ?? nil
        defaultTableView.reloadData()
    }
    
    private func getFilter(term: String) -> [General]? {
        if !term.isEmpty {
            guard let result = controller.getItemsList() else { return nil }
            var resultGeneral: [General] = []
            
            for item in result {
                if item.nome.uppercased().contains(term.uppercased()) {
                    resultGeneral.append(item)
                }
            }
            
            return resultGeneral
        }
        
        return controller.getItemsList()
    }
}
