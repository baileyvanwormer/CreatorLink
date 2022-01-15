//
//  Extensions.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/14/22.
//

import Foundation


struct DatabaseUserField { // Fields within the User document in Database
    
    static let displayName = "display_name"
    static let email = "email"
    static let providerId = "provider_id"
    static let provider = "provider"
    static let userID = "user_id"
    static let bio = "bio"
    static let dateCreated = "date_created"
    
}

struct currentUserDefaults { // Feilds for UserDefaults saved within app
    
    static let displayName = "display_name"
    static let bio = "bio"
    static let userID = "user_id"
    
}

