//
//  RegisterView.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var  viewModel = RegisterViewViewModel()

    @State var email = ""
    @State var password = ""
    @State var name = ""
    
    var body: some View {
        //register
        VStack{
            HeaderView(title: "Register", subTitle: "Start Organizing todos", angle: -15, background: Color.orange)
                .offset(y:-4)
            
            //Register
            Form {
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle() )
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                
                TextField("Email Address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .textFieldStyle(DefaultTextFieldStyle() )
                SecureField("Password", text: $viewModel.password)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)          .textFieldStyle(DefaultTextFieldStyle() )
                
                TLButton(label: "Create Account ", background:.blue)
                          {
                              viewModel.register()
                              
                        }
                    .padding()
                
                
            }
            .offset(y:-10)
            

        }
    }
}

#Preview {
    RegisterView()
}
