//
//  ProfileHeaderView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/8/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @Binding var profileDisplayName: String
    @Binding var profileDisplayUsername: String
    
    var body: some View {
            
        // MARK: Profile Pic
            VStack {
                Image("blue1")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 120, alignment: .center)
                .clipShape(Circle())
                .padding(.top)
             
                
                // MARK: Name
                Text(profileDisplayName)
                    .font(.title2)
                    .bold()
            
                
                // MARK: Username
                Text("@" + profileDisplayUsername.lowercased())
                .padding(.bottom)
            
                
                HStack {
                    
                    Spacer()
                    
                    // MARK: Supporters
                    VStack {
                        
                        Text("133")
                            .font(.title2)
                            .bold()
                        Text("Supporters")
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("244")
                            .font(.title2)
                            .bold()
                        Text("Supporting")
                    }
                    
                    Spacer()
                }
            Divider()
           
                // MARK: Bio
            Text("iOS Developer at UNC Chapel Hill")
                .padding(.vertical)
            
            Divider()
            
                
            }
            
            Spacer()
            Spacer()
            
//        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    
    @State static var name: String = "Joe"
    @State static var username: String = "Joe"
    
    static var previews: some View {
        ProfileHeaderView(profileDisplayName: $name, profileDisplayUsername: $username)
            .previewLayout(.sizeThatFits)
    }
}
