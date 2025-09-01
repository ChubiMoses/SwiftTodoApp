//
//  TodoListView.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import FirebaseFirestore

import SwiftUI

struct TodoListView: View {
    @StateObject var todoVM:TodoListViewViewModel
   @FirestoreQuery var items : [TodoListItem]
   
    init(userId:String) {
        self._items = FirestoreQuery(collectionPath: "Users\(userId)/Todos")
        
        self._todoVM = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){item in
                    TodoListItemView(item: item)
                        .listStyle(PlainListStyle() )
                        .swipeActions{
                            Button("Delete"){
                                
                                todoVM.deleteItem(id:item.id)
                                
                            }.tint(Color.red)
                            
                        }
                }
                
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
