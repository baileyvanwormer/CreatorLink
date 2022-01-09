//
//  PostArrayObject.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/5/22.
//

import Foundation
import SwiftUI

class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel]()
    
    init() {
        
        print("Fetch from database here.")
        
        let post1 = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This is a caption", dateCreated: Date(), likeCount: 0, likedbyUser: false)
        let post2 = PostModel(postID: "", userID: "", username: "Jessica", caption: nil, dateCreated: Date(), likeCount: 0, likedbyUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "Christopher", caption: "This is a really really really long long long caption caption caption", dateCreated: Date(), likeCount: 0, likedbyUser: false)
        let post4 = PostModel(postID: "", userID: "", username: "Jay Bee", caption: nil, dateCreated: Date(), likeCount: 0, likedbyUser: false)
        let post5 = PostModel(postID: "", userID: "", username: "Hamrick", caption: "This is a caption", dateCreated: Date(), likeCount: 0, likedbyUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
        self.dataArray.append(post5)
        
    }
    /// USED FOR SINGLE POST SELECTION
    init(post: PostModel) {
        self.dataArray.append(post)
    }
}
