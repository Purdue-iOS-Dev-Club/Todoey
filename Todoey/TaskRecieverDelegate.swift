//
//  TaskRecieverDelegate.swift
//  Todoey
//
//  Created by Harjas Monga on 9/1/19.
//  Copyright © 2019 Harjas Monga. All rights reserved.
//

import Foundation

protocol TaskRecieverDelegate {
    func recieve(task: Task)
}

protocol TaskCompletionDelegate {
    func completed(index: IndexPath)
}
