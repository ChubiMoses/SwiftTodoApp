//
//  NewItemViewModel.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject{
    @Published var title:String = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    
    init() {
    
    }
    
    
    public func save(){
        guard canSave else{
            return
        }
        
        //get userId
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //create model
        
        let newId =  UUID().uuidString
        
        let newItem = TodoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false )
        
        
        //save model
        let db = Firestore.firestore()
        db.collection("Users").document(userId).collection("Todos")
            .document(newId).setData(newItem.asDictionary())
        
        
        
        
    }
    
    
    
    var canSave:Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
    
    
    
}
