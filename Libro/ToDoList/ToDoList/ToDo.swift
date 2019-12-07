//
//  ToDo.swift
//  ToDoList
//
//  Created by Sofìa Gutièrrez on 11/28/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation
import UIKit

struct ToDo{
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func loadTodos () -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo]{
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        return [todo1, todo2, todo3]
    }
    
    
}
