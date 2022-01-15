//
//  AuthService.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/14/22.
//

// Used to Authenticate users in Firebase
// Used to handle User accounts in Firebase

import Foundation
import FirebaseAuth
import FirebaseFirestore // Database


let DB_BASE = Firestore.firestore()


class AuthService {
    
    
    // MARK: Properties
    
    static let instance = AuthService()
    
    private var REF_USERS = DB_BASE.collection("users")
    
    
    // MARK: Auth User Functions
    
    func logInUserToFirebase(credential: AuthCredential, handler: @escaping (_ providerID: String?, _ isError: Bool) -> ()) {
        
        Auth.auth().signIn(with: credential) { (result, error) in
            
            // Check For Errors
            if error != nil {
                print("Error logging into Firebase")
                handler(nil, true)
                return
            }
            
            // Check for Provider ID
            guard let providerID = result?.user.uid else {
                print("Error getting prodiver ID")
                handler(nil, true)
                return
            }
            
            // Success connecting to Firebase
            handler(providerID, false)
            
            
        }
        
        //
        //
        //
        //
        //
        //
        //
        //
        
        
    }
    
    func logInUserToApp(userID: String, handler: @escaping (_ success: Bool) -> ()) {
        
        // Get the users info
        getUserInfo(forUserID: userID) { (returnedName, returnedBio) in
            if let name = returnedName, let bio = returnedBio {
                // Success
                print("Success getting user info while logging in")
                handler(true)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    
                
                // Set the users info into our app
                UserDefaults.standard.set(userID, forKey: currentUserDefaults.userID)
                UserDefaults.standard.set(bio, forKey: currentUserDefaults.bio)
                UserDefaults.standard.set(name, forKey: currentUserDefaults.displayName)
                }
                
            } else {
              // Error
                print("Error getting user info while logging in")
                handler(false)
            }
        }
        
    }
    
    func createNewUserInDatabase(name: String, email: String, providerID: String, provider: String, profileImage: UIImage, handler: @escaping (_ userID: String?) -> ()) {
        
        // Set up a user document within the user collection
        let document = REF_USERS.document()
        let userID = document.documentID
        
        // Upload profile image to storage
        ImageManager.instance.uploadProfileImage(userID: userID, image: profileImage)
        
        // Upload profile data to Firestore
        let userData: [String: Any] = [
            DatabaseUserField.displayName : name,
            DatabaseUserField.email : email,
            DatabaseUserField.providerId : providerID,
            DatabaseUserField.provider : provider,
            DatabaseUserField.userID : userID,
            DatabaseUserField.bio : "",
            DatabaseUserField.dateCreated : FieldValue.serverTimestamp(),
        ]
        
        document.setData(userData) { (error) in
            
            if let error = error {
                // Error
                print("Error uploading data to user document. \(error)")
                handler(nil)
            } else {
                // Success
                handler(userID)
            }
        }
        
    }
    
    
    // MARK: GET USER PICTURES
    
    
    func getUserInfo(forUserID userID: String, handler: @escaping (_ name: String?, _ bio: String?) -> ()) {
        
        REF_USERS.document(userID).getDocument { (documentSnapshot, error) in
            
            if let document = documentSnapshot,
               let name = document.get(DatabaseUserField.displayName) as? String,
               let bio = document.get(DatabaseUserField.bio) as? String {
                
                print("Success getting user info")
                handler(name, bio)
                return
            } else {
                print("Error getting user info")
                handler(nil, nil)
            }
            
        }
        
        
    }
}
