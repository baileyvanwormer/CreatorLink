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
                HomeView(posts: PostArrayObject())
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            Text("Search")
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            
            Text("Post")
                .tabItem {
                    VStack {
                        Image(systemName: "plus.app")
                        Text("Post")
                    }
                }
            
            Text("Learn")
                .tabItem {
                    VStack {
                        Image(systemName: "brain.head.profile" )
                        Text("Learn")
                    }
                }
            
            Text("Profile")
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
