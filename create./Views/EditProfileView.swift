//
//  EditProfileView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/14/21.
//

import SwiftUI

struct EditProfileView: View {
    
@State private var name: String = ""
@State private var username: String = ""
@State private var pronouns: String = ""
@State private var bio: String = ""
    
    var body: some View {
        
        VStack (spacing: 10) {
            
            HStack {
                
                Image("create.banner")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 25, alignment: .center)
                
                Spacer()
                
                
            }
            Divider()
            
            VStack {
                Image("van_wormers")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 120, alignment: .center)
                .clipShape(Circle())
                .padding(.top)
                
                Text("Edit Image")
                    .foregroundColor(Color.pink)
                    
            Divider()
                
                TextField("Name", text: $name)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding([.horizontal, .bottom])
                
            Divider()
            
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding([.horizontal, .bottom])
            
            Divider()
                
                TextField("Pronouns", text: $pronouns)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding([.horizontal, .bottom])
                
            Divider()
                
                TextField("Bio", text: $bio)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding([.horizontal, .bottom])
            }
            
            Divider()
            
            Spacer()
            Spacer()
        
        Button(action: {}) {
        }
        NavigationLink("Sign Out", destination: SignInView())
            .padding(.all)
            .cornerRadius(8)
            .foregroundColor(Color.pink)
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
