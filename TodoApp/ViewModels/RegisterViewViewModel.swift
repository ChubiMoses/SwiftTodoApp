//
//  RegisterViewViewModel.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class RegisterViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var errorMessage = ""
    
    
    
    init() {
      
       
    }
    
    func register(){
        guard validate() else{
            return ;
        }
        
        print("Rig........")
        
        Auth.auth().createUser(withEmail: email, password: password ){[weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id:userId)
        }
        
        
    }
    
    
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("Users").document(id).setData(newUser.asDictionary() )
        
        
    }
    
    
     private func validate()->Bool{
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces ).isEmpty,
              !name.trimmingCharacters(in: .whitespaces ).isEmpty else{
              errorMessage = "Please fill in all fields."
            return false
        }
            
        guard email.contains("@") && email.contains(".") else{
                errorMessage = "Please enter valid email"
            
            return false
        }
        
        guard password.count >= 6 else{
                errorMessage = "Min Password length is 6"
            
            return false
        }
        
        return true
        
    }
    
    
    
}
