//
//  PostView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI
import Firebase

struct PostView: View {
    
    @State private var caption = ""
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Image(systemName: "arrow.backward")
                    .padding()
                
                Spacer()
                
                Text("New Post")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                    
                
                Spacer()
                
                Button(action: {}) {
                }
                NavigationLink("Next", destination: PostPreviewView())
                    .padding(.all)
                    .cornerRadius(8)
                    .foregroundColor(Color.blue)
                
                Spacer()
            }
            
            Divider()
            
            Image("ashe")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity, height: 500)
                .padding()
            
            Divider()
            
            HStack {
                
                Image(systemName: "photo")
                    .padding()
                
                Image(systemName: "camera.filters")
                    .padding()
                
                Image(systemName: "crop")
                    .padding()
                
                Image(systemName: "crop.rotate")
                    .padding()
                
                Image(systemName: "plusminus.circle")
                    .padding()
                
                Image(systemName: "slider.horizontal.3")
                    .padding()
                      
            }
            
            Divider()
            
            TextField("Caption...", text: $caption)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
