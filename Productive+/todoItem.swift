//
//  todoItem.swift
//  todoTest
//
//  Created by scholar on 8/17/23.
//

import Foundation

class todoItem: Identifiable
{
    var id = UUID()
    var title = ""
    var isDone = false
    
    init(title: String, isDone: Bool = false) {
            self.title = title
            self.isDone = isDone
        }
}

