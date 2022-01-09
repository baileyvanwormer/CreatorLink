//
//  HomeView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var posts: PostArrayObject
    var title: String
    
    var body: some View {
        VStack (spacing: 10) {
            
//            HStack {
//
//                Image("create.banner")
//                    .renderingMode(.original)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200, height: 25, alignment: .center)
//
//                Spacer()
//
//                Image(systemName: "ellipsis")
//                    .padding()
//
//                Image(systemName: "tray")
//                    .padding()
//
//
//
//            }
//
//            Divider()
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(posts.dataArray, id: \.self) { post in
                        SinglePostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
                    }
                }
                .navigationBarTitle("")
                .navigationBarItems(leading:
                Image("create.banner")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 25, alignment: .center)
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                                        Button(action: {
                    
                }, label: {
                    Image(systemName: "tray")
                })
                )
                .navigationBarItems(trailing: Spacer())
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(posts: PostArrayObject(), title: "Feed Test")
        }
    }
}
