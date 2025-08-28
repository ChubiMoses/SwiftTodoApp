//
//  LoginView.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            
            VStack{
                //Header
                HeaderView()
                
                //Login
                Form {
                    
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle() )
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle() )
                    Button{
                        //login
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                            Text("Login ")
                                .foregroundColor(Color.white).bold()
                        }
                    }
                    
                }
                
                //Crreate Account
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
