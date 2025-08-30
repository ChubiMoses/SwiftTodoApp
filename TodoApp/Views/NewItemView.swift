//
//  NewItemView.swift
//  TodoApp
//
//  Created by MAC on 8/29/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newVM = NewItemViewViewModel()
    @Binding var newItemPresented:Bool

    var body: some View {
        
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form{
                TextField("Title", text: $newVM.title)
                
                DatePicker("Due Date", selection: $newVM.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle() )
                
                TLButton(label: "Save", background:.blue, action: {
                    if (newVM.canSave){
                        newVM.save()
                        newItemPresented = false
                    }else{
                        newVM.showAlert = true
                    }
                   
                })
                .alert(isPresented: $newVM.showAlert) {
                    Alert(title: Text("Error"), message: Text("Please fill in all fields and select the upcoming date"))
                }
               
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in
        //
    }))
}
