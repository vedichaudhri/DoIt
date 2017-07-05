//
//  CreateTaskViewController.swift
//  DoIT
//
//  Created by Vedi Chaudhri on 7/5/17.
//  Copyright © 2017 Vedi Chaudhri. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameText: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
   // var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func addTapped(_ sender: Any) {
        //create a Task with the outlet information
        //let task = Task();
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskNameText.text!
        task.important = importantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //add new task to previous viewController
       // previousVC.tasks.append(task)
       // previousVC.tableView.reloadData()
        
        //pop back
        navigationController!.popViewController(animated: true)
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    

    

}
