//
//  AccountView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var pronouns: String = ""
    @State private var bio: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack (spacing: 10) {
            
            HStack {
                
                Image("create.banner")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 25, alignment: .center)
                
                Spacer()
                
                
                Button(action: {}) {
                }
                NavigationLink("Edit Profile", destination: EditProfileView())
                    .padding(.all)
                    .cornerRadius(8)
                    .foregroundColor(Color.pink)
                    .navigationTitle("")
                    .navigationBarHidden(true)
                
                
            }
            Divider()
            
            VStack {
                Image("blue1")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 120, alignment: .center)
                .clipShape(Circle())
                .padding(.top)
                
                Text("Bailey Van Wormer")
                    .font(.title2)
                    .bold()
            
            Text("@baileyvanwormer")
                .padding(.bottom)
            
                
                HStack {
                    
                    Spacer()
                    
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
            
            Text("iOS Developer at UNC Chapel Hill")
                .padding(.vertical)
            
            Divider()
            
                
            }
            
            Spacer()
            Spacer()
            
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountView()
            AccountView()
                .previewInterfaceOrientation(.portraitUpsideDown)
            AccountView()
            AccountView()
        }
    }
}
