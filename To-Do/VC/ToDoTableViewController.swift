//
//  ToDoTableViewController.swift
//  To-Do
//
//  Created by shawky on 7/15/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoTableViewController: UITableViewController {

    
    var tasks = [ToDoList]()
    
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
        self.navigationItem.setHidesBackButton(true, animated:true);
        
    }
  

    
    
    func loadData () {
        
        let realm = try! Realm()
        let tasksss = realm.objects(ToDoList.self)
       
        
        self.tasks = Array(tasksss)
        self.tableView.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        
    }
 
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
   
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)

            
            
        
            let task = tasks[indexPath.row]
            
        cell.textLabel?.text = task.realmTasks

        return cell
    }
   
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "delete") { (action, view, completion) in
          
            completion(true)
            action.image = #imageLiteral(resourceName: "trash")
            action.backgroundColor = .red
        }
        
        let realm = try! Realm()
  
        let tasksss = Array(realm.objects(ToDoList.self))
        
       
        
        try! realm.write {
            
            realm.delete(tasksss[indexPath.row])
            
        }
    
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    


  
}
