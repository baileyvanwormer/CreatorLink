//
//  create_App.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct create_App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
