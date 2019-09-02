//
//  TaskTableViewCell.swift
//  Todoey
//
//  Created by Harjas Monga on 9/1/19.
//  Copyright © 2019 Harjas Monga. All rights reserved.
//

import UIKit


class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var completionButton: UIButton!
    @IBOutlet private weak var taskLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    private var location: IndexPath?
    private let dateFormatter = DateFormatter()
    
    var taskCompletionListener: TaskCompletionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dateFormatter.dateStyle = .medium
        self.dateLabel.tintColor = .clear
    }
    
    func configure(with todo: Task, location index: IndexPath) {
        self.taskLabel.text = todo.description
        self.dateLabel.text = self.dateFormatter.string(from: todo.deadline)
        self.location = index
        self.completionButton.layer.cornerRadius = self.completionButton.frame.width / 2
        self.completionButton.backgroundColor = nil
        self.completionButton.layer.borderWidth = 2
        self.completionButton.layer.borderColor = UIColor.red.cgColor
    }
    
    @IBAction func completionButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            self.completionButton.backgroundColor = .red
        }) { (finished) in
            if let location = self.location {
                self.taskCompletionListener?.completed(index: location)
            }
        }
    }
}
