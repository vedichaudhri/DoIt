//
//  TasksViewController.swift
//  DoIT
//
//  Created by Vedi Chaudhri on 7/5/17.
//  Copyright © 2017 Vedi Chaudhri. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks :[Task] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if (task.important) {
            cell.textLabel?.text = "‼️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = true
        
        let task2 = Task()
        task2.name = "Walk"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Excercise"
        task3.important = false
        
        return [task1, task2, task3]
        
    }

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }
    
    
    //tells you if youre running out of memory  -- too advanced for right now
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

