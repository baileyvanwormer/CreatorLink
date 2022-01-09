//
//  ContentView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            NavigationView {
                HomeView(posts: PostArrayObject(), title: "Feed")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
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
            
            Text("Coming Soon")
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
