//
//  TodoListItemModel.swift
//  TodoApp
//
//  Created by MAC on 8/30/25.
//

import Foundation

struct TodoListItem: Codable, Identifiable{
    let id:String
    let title:String
    let dueDate:TimeInterval
    let createdDate:TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(_ state:Bool){
        isDone = state 
    }
}
