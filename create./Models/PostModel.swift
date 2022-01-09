//
//  PostModel.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/5/22.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    
    var id = UUID()
    var postID: String // ID for the post in database
    var userID: String // ID for user in database
    var username: String // username of user in database
    var name: String // Actual name of user in database
    var caption: String? // caption of post
    var dateCreated: Date
    var likeCount: Int
    var likedbyUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    // postID
    // userID
    // user username
    // caption - optional
    // date
    // like count
    // liked by current user
}
