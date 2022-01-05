//
//  CommentModel.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/5/22.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String // ID for comment in the database
    var userID: String // ID for the user in the database
    var username: String // username for the user in the database
    var content: String // Actual comment text
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
