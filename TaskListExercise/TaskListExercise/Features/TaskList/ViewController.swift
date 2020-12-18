//
//  ViewController.swift
//  TaskListExercise
//
//  Created by Glayce Kelly on 09/12/20.

// Faça um app que:
// Seja uma lista de tarefas:
// Primeiro passo:
// - Deve permitir cadastrar a tarefa;
// - Deve permitir marcar como concluída;
// Segundo passo:
// - Deve permitir editar a tarefa;
// - Deve permitir excluir a tarefa;

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var newTaskTextField: UITextField!
    @IBOutlet weak var addingTaskButton: UIButton!
    @IBOutlet weak var tasksTableView: UITableView!
    
    // MARK: - Properties
    
    var arrayTaskList: [TaskList] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tasksTableView.backgroundColor = .white
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        
        loadData()
    }
    
    // MARK: - Actions
    
    @IBAction func addingTaskAction(_ sender: UIButton) {
        guard let newTask: String = newTaskTextField.text else { return }
        
        DBManager.shared.saveData(with: newTask) { (taskList) in
            self.arrayTaskList.append(taskList)
        }
        
        tasksTableView.reloadData()
        cleanFields()
        print("Novo item salvo: \(newTask)")
    }
}

// MARK: - Private Methods

extension ViewController {
    
    private func loadData() {
        DBManager.shared.loadData { (arrayTaskList) in
            self.arrayTaskList.append(contentsOf: arrayTaskList)
        }
    }
    
    private func cleanFields() {
        newTaskTextField.text = ""
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayTaskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TaskListTableViewCell", owner: self, options: nil)?.first as! TaskListTableViewCell
        cell.prepareCell(with: self.arrayTaskList[indexPath.row], tableView: tableView, viewController: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
