//
//  TaskListTableViewCell.swift
//  TaskListExercise
//
//  Created by Glayce Kelly on 11/12/20.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var taskList: TaskList?
    var tableView: UITableView?
    var viewController: UIViewController?
    
    // MARK: - Outlets
    
    @IBOutlet weak var taskListItemLabel: UILabel!
    @IBOutlet weak var editLabel: UILabel!
    @IBOutlet weak var doneLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        editLabel.isUserInteractionEnabled = true
        doneLabel.isUserInteractionEnabled = true
        
        let editTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleEditGesture(_:)))
        editLabel.addGestureRecognizer(editTap)
        
        let doneTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleDoneGesture(_:)))
        doneLabel.addGestureRecognizer(doneTap)
    }
}

// MARK: - Methods

extension TaskListTableViewCell {
    
    func prepareCell(with taskList: TaskList, tableView: UITableView, viewController: UIViewController) {
        self.taskList = taskList
        self.tableView = tableView
        self.viewController = viewController
        
        configureLabel(with: taskList)
    }
    
    // MARK: - Private methods
    
    private func configureLabel(with taskList: TaskList) {
        taskListItemLabel.text = taskList.name
        
        if taskList.isCompleted {
            taskListItemLabel.textColor = .red
        }
    }
    
    // MARK: - Helpers
    
    @objc func handleEditGesture(_ sender: UITapGestureRecognizer) {
        let utils: Utils = Utils()
        utils.delegate = self
        utils.openAlertCotroller(viewController: viewController, title: "Editar tarefa", message: nil)
        print("edit!!")
    }
    
    @objc func handleDoneGesture(_ sender: UITapGestureRecognizer) {
        guard let taskList: TaskList = taskList else { return }
        DBManager.shared.completedTask(id: taskList.objectID, isCompleted: true)
        tableView?.reloadData()
        print("done!!")
    }
}

// MARK: - UtilsDelegate

extension TaskListTableViewCell: UtilsDelegate {
    func didTouchEditTask(editedTask: String) {
        guard let taskList: TaskList = taskList else { return }
        DBManager.shared.editData(id: taskList.objectID, name: editedTask)
        tableView?.reloadData()
        print("Texto editado: \(editedTask)")
    }
}
