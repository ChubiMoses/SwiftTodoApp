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
    let dueDate:String
    let createdDate:TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(){
        
    }
}
