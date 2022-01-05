//
//  HomeView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack (spacing: 10) {
            
            HStack {
//                Spacer()
                
                Image("create.banner")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 25, alignment: .center)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .padding()
                
//                Spacer()
                
                Image(systemName: "tray")
                    .padding()
                
            
                
            }
            Divider()
            
            ScrollView(.horizontal) {
                HStack {
                    VStack {
        
                    Image("walk")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    Text("Bright")
                    
                    }
                    VStack {
                        
                        Image("sun")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Sun")
                    }
                    
                    VStack {
                        
                        Image("ashe")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("asheville")
                        
                    }
                }
            }
            
            Spacer()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
