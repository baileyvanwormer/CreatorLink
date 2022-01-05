//
//  HomeView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        VStack (spacing: 10) {
            
            HStack {
                
                Image("create.banner")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 25, alignment: .center)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .padding()
                
                Image(systemName: "tray")
                    .padding()
                
            
                
            }
            
            Divider()
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(posts.dataArray, id: \.self) { post in
                        SinglePostView(post: post)
                    }
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(posts: PostArrayObject())
    }
}
