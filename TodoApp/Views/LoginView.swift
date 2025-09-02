//
//  LoginView.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import SwiftUI

struct LoginView: View {
    
  @StateObject var  loginVM = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack{
                //Header
                HeaderView(title: "Todo List", subTitle: "Get things done", angle: 15, background: Color.blue)
                
                //Login
                Form {
                    
                    if !loginVM.errorMessage.isEmpty{
                        Text(loginVM.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $loginVM.email)
                        .textFieldStyle(DefaultTextFieldStyle() )
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $loginVM.password)
                        .textFieldStyle(DefaultTextFieldStyle() )
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TLButton(label: "Login ", background:.blue)
                              {
                                  loginVM.login()
                            }
                       
                    }
                    
                .offset(y:-10)
                
                //Create Account
                VStack{
                    Text("New around here? ")
//                    Button("Create account"){
//                        //
//                    }
                    NavigationLink("Create account", destination: RegisterView())
                       
                }
                
                Spacer()
            }
        }
    }

}

#Preview {
    LoginView()
}
