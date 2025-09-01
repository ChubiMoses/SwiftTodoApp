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
        Image(systemName: "person.cicle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        
        VStack{
            HStack{
                Text("Name:")
                Text(user.name)
            }
            HStack{
                Text("Email")
                Text(user.email)
            }
            HStack{
                Text("Member Since:")
                Text("\(Date(timeIntervalSince1970:user.joined).formatted(date:.abbreviated, time:.shortened))")
            }
        }.padding()
        
        Button("Log Out") {
            viewModel.logout()
        }
        .tint(.red)
        .padding()
    }
}

#Preview {
    ProfileView()
}
