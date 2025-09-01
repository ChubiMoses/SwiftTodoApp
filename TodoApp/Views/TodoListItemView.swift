//
//  TodoListItemView.swift
//  TodoApp
//
//  Created by MAC on 8/30/25.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel();
    let item:TodoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date:.abbreviated, time:.shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}


#Preview {
    TodoListItemView(item: .init(id: "id", title: "Hit the gim", dueDate:Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
