//
//  SinglePostView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/5/22.
//

import SwiftUI

struct SinglePostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            
            // MARK: HEADER
            if showHeaderAndFooter {
                HStack {
                    Image("blue1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30, alignment: .center)
                        .cornerRadius(15)
                    
                    Text(post.username)
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Spacer ()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                    
                    
                }
                .padding(.all)
            }
            
            
            // MARK: IMAGE
            
            Image("walk")
                .resizable()
                .scaledToFit()
            
            // MARK: FOOTER
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20, content: {
                    
                    Image(systemName: "heart")
                        .font(.title3)
                    
                    NavigationLink(
                        destination: CommentsView(),
                        label: {
                            Image(systemName: "bubble.middle.bottom")
                                .font(.title3)
                                .foregroundColor(.primary)
                        })
                    
                    Image(systemName: "paperplane")
                        .font(.title3)
                    
                    Spacer()
                })
                .padding(.all)
                
                if let caption = post.caption {
                HStack {
                    
                    Text(caption)
                    
                    Spacer(minLength: 0)
                    
                    }
                    
                .padding(.all)
                    
                }
            }
            
            Divider()
                
        })
    }
}

struct SinglePostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedbyUser: false)
    
    static var previews: some View {
        SinglePostView(post: post, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
