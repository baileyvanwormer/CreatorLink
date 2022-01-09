//
//  ContentView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI

struct ContentView: View {
    
    var currentUserID: String? = nil
    
    var body: some View {
        
        TabView {
            NavigationView {
                HomeView(posts: PostArrayObject(), title: "Feed")
            }
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            NavigationView {
                SearchView()
            }
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            NavigationView {
                UploadView()
            }
                .tabItem {
                    VStack {
                        Image(systemName: "plus.app")
                        Text("Post")
                    }
                }
            
            Text("Coming Soon")
                .tabItem {
                    VStack {
                        Image(systemName: "brain.head.profile" )
                        Text("Learn")
                    }
                }
            ZStack {
                if currentUserID != nil {
                    NavigationView {
                        AccountView___New(isMyProfile: true, profileDisplayName: "My Profile", profileDisplayUsername: "username", profileUserID: "")
                    }
                } else {
                    NewAccountView()
                }
            }
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
