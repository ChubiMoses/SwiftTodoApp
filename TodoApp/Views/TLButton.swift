//
//  TLButton.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import SwiftUI

struct TLButton: View {
    let label:String
    let background:Color
    let action:() -> Void
    
    var body: some View {
        Button{
            action()
            }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                Text(label)
                    .foregroundColor(Color.white).bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(label: "Login", background: Color.blue) {
       // 
    }
}
