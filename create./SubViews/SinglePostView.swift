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
    @State var showActionSheet: Bool = false
    @State var actionSheetType: PostActionSheetOption = .general
    @State var postImage: UIImage = UIImage(named: "blue1")!
    enum PostActionSheetOption {
        case general
        case reporting
    }
    
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
                    
                    Button(action: {
                        showActionSheet.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    })
                        .accentColor(.primary)
                        .actionSheet(isPresented: $showActionSheet, content: {
                            getActionSheet()
                        })
                    
                }
                .padding(.all)
            }
            
            
            // MARK: IMAGE
            
            ZStack {
                Image(uiImage: postImage)
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
                    
                    Button(action: {
                        sharePost()
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    })
                        .accentColor(.primary)
                    
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
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, name: post.name, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedbyUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            animateLike = false
        }
        
    }
    
    func unlikePost() {
        
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, name: post.name, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedbyUser: false)
        self.post = updatedPost
        
    }
    
    
    func getActionSheet() -> ActionSheet {
        
        switch self.actionSheetType {
        case .general:
            return ActionSheet(title: Text("What would you like to do?"), message: nil, buttons: [
                .destructive(Text("Report"), action: {
                    
                    
                    self.actionSheetType = .reporting
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showActionSheet.toggle()
                    }
                }),
                
                    .default(Text("Learn more..."), action: {
                        print("LEARNMORE PRESSED")
                    }),
                
                    .cancel()
            ])
        case .reporting:
            return ActionSheet(title: Text("Why are you reporting this button?"), message: nil, buttons: [
                
                .destructive(Text("This is innappropriate."), action: {
                    reportPost(reason: "This is inappropriate.")
                }),
                .destructive(Text("This is spam."), action: {
                    reportPost(reason: "This is spam.")
                }),
                .destructive(Text("It made me uncomfortable."), action: {
                    reportPost(reason: "It made me uncomfortable.")
                }),
                
                    .cancel({
                        self.actionSheetType = .general
                    })
            ])
        }
    }
    
    func reportPost(reason: String) {
        print("REPORT POST NOW")
    }
    
    func sharePost() {
        
        let message = "Checkout this post on Create."
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
}

struct SinglePostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", name: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedbyUser: false)
    
    static var previews: some View {
        SinglePostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
