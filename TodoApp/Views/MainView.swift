//
//  ContentView.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainViewViewModel()
    
    var body: some View {
        if mainVM.isSignedIn,!mainVM.currentUserId.isEmpty {
            accountView
        }else{
            LoginView()
        }
    }
    
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            TodoListView(userId:mainVM.currentUserId)
                .tabItem{
                    Label("Home",systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
    }
}
  

#Preview {
    MainView ()
}
