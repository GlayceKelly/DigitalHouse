//
//  TaskListTableViewCell.swift
//  TaskListExercise
//
//  Created by Glayce Kelly on 11/12/20.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    var taskList: TaskList?
    
    //MARK: - Outlets
    
    @IBOutlet weak var taskListItemLabel: UILabel!
    @IBOutlet weak var editLabel: UILabel!
    @IBOutlet weak var doneLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // configurando o tapGesture
        let editTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleEditGesture(_:)))
        editLabel.addGestureRecognizer(editTap)
        
        let doneTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleDoneGesture(_:)))
        editLabel.addGestureRecognizer(doneTap)
    }
}

extension TaskListTableViewCell {
    func prepareCell(with taskList: TaskList) {
        taskListItemLabel.text = taskList.name
        self.taskList = taskList
    }
    
    // MARK: - Helpers
    
    @objc func handleEditGesture(_ sender: UITapGestureRecognizer) {
        guard let taskList: TaskList = taskList else { return }
        DBManager.shared.editData(id: taskList.objectID, name: "EDITADO")
        print("edit!!")
    }
    
    @objc func handleDoneGesture(_ sender: UITapGestureRecognizer) {
        print("done!!")
    }
}
