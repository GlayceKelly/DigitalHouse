//
//  ViewController.swift
//  RealmExercicio
//
//  Created by Glayce Kelly on 04/12/20.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rex = Dog()
        rex.name = "Rex"
        rex.age = 1
        
        let realm = try! Realm()
        
        let dogs = realm.objects(Dog.self).filter("age < 2")
        print(dogs.count)
        
        try! realm.write {
            realm.add(rex)
        }
        
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                let theDog = realm.objects(Dog.self).filter("age == 1").first
                print(theDog)
                try! realm.write {
                    theDog!.age = 3
                }
            }
        }
    }
}

