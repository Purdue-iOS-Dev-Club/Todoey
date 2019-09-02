//
//  TasksViewController.swift
//  Todoey
//
//  Created by Harjas Monga on 9/1/19.
//  Copyright © 2019 Harjas Monga. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var todoList: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addTaskVC = segue.destination as? AddTaskViewController else {
            return
        }
        addTaskVC.taskTarget = self
    }

}

extension TasksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: todoList[indexPath.row], location: indexPath)
        cell.taskCompletionListener = self
        return cell
    }
    
}

extension TasksViewController: TaskRecieverDelegate {
    
    func recieve(task: Task) {
        todoList.append(task)
        self.tableView.reloadData()
    }
    
}

extension TasksViewController: TaskCompletionDelegate {
    
    func completed(index: IndexPath) {
        self.todoList.remove(at: index.row)
        self.tableView.reloadData()
    }
    
}
