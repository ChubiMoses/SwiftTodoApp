//
//  TodoListView.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var todoVM = TodoListViewViewModel()
    private let userId:String
   
    init(userId:String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To do List")
            .toolbar{
                Button{
                    todoVM.showingNewItemView = true
                }label: {
                        Image(systemName: "plus")
         
                  }
                }
            .sheet(isPresented: $todoVM.showingNewItemView) {
                NewItemView(
                    newItemPresented: $todoVM.showingNewItemView
                )
             }
            }
        }

    }


#Preview {
    TodoListView(userId: "")
}
