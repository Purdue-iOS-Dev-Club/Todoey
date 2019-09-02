//
//  AddTaskViewController.swift
//  Todoey
//
//  Created by Harjas Monga on 9/1/19.
//  Copyright © 2019 Harjas Monga. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet private weak var taskDescriptionField: UITextField!
    @IBOutlet private weak var dueDateField: UITextField!
    @IBOutlet private weak var addTaskButton: UIButton!
    private let datePicker = UIDatePicker()
    private let dateFormatter = DateFormatter()
    
    var taskTarget: TaskRecieverDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskDescriptionField.becomeFirstResponder()
        self.addTaskButton.layer.borderColor = UIColor.lightGray.cgColor
        self.addTaskButton.setTitleColor(.lightGray, for: .normal)
        self.addTaskButton.layer.borderWidth = 2
        self.addTaskButton.layer.cornerRadius = 10
        self.addTaskButton.isEnabled = false
        setupDatePicker()
    }
    
    @IBAction func addTaskPressed(_ sender: UIButton) {
        let newTask = Task(description: taskDescriptionField.text ?? "", deadline: datePicker.date)
        self.taskTarget?.recieve(task: newTask)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupDatePicker() {
        self.datePicker.addTarget(self, action: #selector(self.datePickerUpdated), for: .valueChanged)
        self.datePicker.datePickerMode = .date
        self.datePicker.minimumDate = Date()
        self.dueDateField.inputView = self.datePicker
        self.dateFormatter.dateFormat = "MM/dd/yy"
        datePickerUpdated()
    }
    
    @objc func datePickerUpdated() {
        let selectedDate = datePicker.date
        self.dueDateField.text = self.dateFormatter.string(from: selectedDate)
    }
    
    @IBAction func taskEdited(_ sender: Any) {
        let buttonEnabled = !(taskDescriptionField.text?.isEmpty ?? true) && !(dueDateField.text?.isEmpty ?? true)
        self.addTaskButton.isEnabled = buttonEnabled
        let buttonColor = (!(taskDescriptionField.text?.isEmpty ?? true) && !(dueDateField.text?.isEmpty ?? true)) ? self.view.tintColor : UIColor.lightGray
        self.addTaskButton.layer.borderColor = buttonColor?.cgColor
        self.addTaskButton.setTitleColor(buttonColor, for: .normal)
    }
}
