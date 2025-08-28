//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import FirebaseCore
import SwiftUI

@main
struct TodoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
