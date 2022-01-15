//
//  SignInWithGoogle.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/10/22.
//

import Foundation
import SwiftUI
import GoogleSignIn
import FirebaseAuth

class signInWithGoogle: NSObject, GIDSignInDelegate {
    
    static let instance = SignInWithGoogle()
    
    func startSignInWithGoogleFLow() {
        
        GIDSignIn.sharedInstance().delegate.self
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance()?.presentingViewController?.modalPresentationStyle = .fullScreen
        GIDSignIn.sharedInstance().signInWithConfiguration:presentingViewController:callback:
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
}
