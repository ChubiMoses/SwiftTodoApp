//
//  ProfileViewViewModel.swift
//  TodoApp
//
//  Created by MAC on 8/29/25.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class TodoListItemViewViewModel: ObservableObject{
    
    
    init(){
        
    }
    
    
    public func toggleIsDone(item:TodoListItem){
        
        var itemCopy = item;
        
        itemCopy.setDone(item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db =  Firestore.firestore()
        
        db.collection("Users").document(uid )
            .collection("Todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
        
        
        
        
    }
    
}
