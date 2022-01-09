//
//  AccountView - New.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/8/22.
//

import SwiftUI

struct AccountView___New: View {
    
    var isMyProfile: Bool
    @State var profileDisplayName: String
    @State var profileDisplayUsername: String
    var profileUserID: String
    var posts = PostArrayObject()
    @State var showSettings: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ProfileHeaderView(profileDisplayName: $profileDisplayName, profileDisplayUsername: $profileDisplayUsername)
            
            ImageGridView(posts: posts)
        })
            .navigationBarTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                showSettings.toggle()
            }, label: {
                Image(systemName: "line.horizontal.3")
            })
                                    .opacity(isMyProfile ? 1.0 : 0.0)
            )
            .sheet(isPresented: $showSettings,
                   content: {
                SettingsView()
            })
    }
}

struct AccountView___New_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountView___New(isMyProfile: true, profileDisplayName: "Joe", profileDisplayUsername: "Joe", profileUserID: "", showSettings: false)
        }
    }
}
