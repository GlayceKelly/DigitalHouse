//
//  DBManager.swift
//  TaskListExercise
//
//  Created by Glayce Kelly on 11/12/20.
//

import Foundation
import CoreData

class DBManager {
    
    //MARK: - Public Properties
    
    static var shared: DBManager = DBManager()
    
    //MARK: - Private Properties
    
    private var tableName: String = "TaskList"
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: tableName)
        
        container.loadPersistentStores(completionHandler: {_, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    //MARK: - DB Methods
    
    func saveData(with name: String, completion: (TaskList) -> Void) {
        let context = persistentContainer.viewContext
        let taskList = TaskList(context: context)
        taskList.name = name
        
        try? context.save()
        completion(taskList)
    }
    
    func loadData(completion: ([TaskList]) -> Void) {
        let context: NSManagedObjectContext = persistentContainer.viewContext
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: tableName)
        let result: [Any]? = try? context.fetch(request)
        
        guard let arrayTaskList: [TaskList] = result as? [TaskList] else { return }
        completion(arrayTaskList)
    }
    
    func editData(id: NSManagedObjectID, name: String) {
        let context: NSManagedObjectContext = persistentContainer.viewContext
        let taskList: TaskList? = context.object(with: id) as? TaskList
        taskList?.name = name
        
        try? context.save()
    }
    
}
