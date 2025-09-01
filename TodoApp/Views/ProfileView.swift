//
//  ProfileView.swift
//  TodoApp
//
//  Created by MAC on 8/29/25.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel();
 
    var body: some View {
        NavigationView{
         
            VStack{
                    if let user = viewModel.user{
                        profile(user: user)
                        
                    }else{
                        Text("Loading user......")
                    }
                    
                }
                .navigationTitle("Profile")
                .onAppear{
                    viewModel.fetchUser()
                }
           
            
        }
    }
    
    @ViewBuilder
    func profile(user:User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        
        VStack(alignment: .leading){
            
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
                    .bold()
            }
            .padding()
            HStack{
                Text("Email")
                    .bold()
                Text(user.email)
                    .bold()
            }
            .padding()
            HStack{
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970:user.joined).formatted(date:.abbreviated, time:.shortened))")
                    .bold()
            }.padding()
        }.padding()
        
        Button("Log Out") {
            viewModel.logout()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
