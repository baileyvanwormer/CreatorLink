//
//  SignInWithAppleButtonCustom.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/9/22.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonCustom: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ UIViewType: ASAuthorizationAppleIDButton, context: Context) { }
}
