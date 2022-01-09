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
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            
            // MARK: HEADER
            if showHeaderAndFooter {
                HStack {
                    
                    NavigationLink(destination: AccountView___New(isMyProfile: false, profileDisplayName: post.name, profileDisplayUsername: post.username, profileUserID: post.userID, showSettings: false), label: {
                        
                        Image("blue1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(15)
                        
                        Text(post.username.lowercased())
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    })
                    
                    Spacer ()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                    
                    
                }
                .padding(.all)
            }
            
            
            // MARK: IMAGE
            
            ZStack {
                Image("walk")
                    .resizable()
                .scaledToFit()
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
            
            // MARK: FOOTER
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20, content: {
                    
                    Button(action: {
                        if post.likedbyUser {
                            unlikePost()
                        } else {
                            likePost()
                        }
                    }, label: {
                        Image(systemName: post.likedbyUser ? "heart.fill" : "heart")
                            .font(.title3)
                    })
                        .accentColor(post.likedbyUser ? .red : .primary)
                    
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
    
    // MARK: Functions
    
    func likePost() {
        
        // Update the local data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, name: post.name, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedbyUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            animateLike = false
        }
        
    }
    
    func unlikePost() {
        
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, name: post.name, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedbyUser: false)
        self.post = updatedPost
        
    }
}

struct SinglePostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", name: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedbyUser: false)
    
    static var previews: some View {
        SinglePostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
