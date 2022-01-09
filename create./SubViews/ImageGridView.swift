//
//  ImageGridView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/5/22.
//

import SwiftUI

struct ImageGridView: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
           ],
          alignment: .center,
          spacing: nil,
          pinnedViews: [],
          content: {
            ForEach(posts.dataArray, id: \.self) {post in
                
                NavigationLink(
                    destination: HomeView(posts: PostArrayObject(post: post), title: "Post"),
                    label: {
                        SinglePostView(post: post, showHeaderAndFooter: false)
                
                })
            }
        })
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(posts: PostArrayObject())
    }
}
