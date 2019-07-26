//
//  AddToDoViewController.swift
//  To-Do
//
//  Created by shawky on 7/15/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import UIKit
import RealmSwift

class AddToDoViewController: UIViewController {
    // MARK: Outlets
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var segmentedControl: UIStackView!
   
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
           

        }
    
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
       if segue.identifier == "backToToDo" {
        
       let myToDo = ToDoList()

       myToDo.realmTasks = textView.text!
        
      let realm = try! Realm()
        
        try! realm.write {
         
            realm.add(myToDo)
            
        }
    
        }

    }
    
    
    @IBAction func cancelButton(_ sender: UIButton) {
   
     performSegue(withIdentifier: "backToToDo", sender: self)
    }
    
   
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
       
         performSegue(withIdentifier: "backToToDo", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        

    }
    

}

extension AddToDoViewController : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
       
        if doneButton.isHidden {
            
            textView.text.removeAll()
            
            doneButton.isHidden = false
          
        }
    }
    
    
}
