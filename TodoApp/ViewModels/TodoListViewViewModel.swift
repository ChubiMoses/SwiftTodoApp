//
//  TodoListViewViewModel.swift
//  TodoApp
//
//  Created by MAC on 8/29/25.
//


import FirebaseFirestore
import FirebaseAuth
import Foundation

class TodoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userId:String
    
    
    
    init(userId:String){
        self.userId = userId
        
    }
    
    
    /// Delete todo  item
    /// - Parameter id: item id to delete
    func deleteItem(id:String){
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(userId)
            .collection("Todos").document(id).delete()
        
    }
    
}
