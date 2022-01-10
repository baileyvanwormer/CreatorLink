//
//  OnboardingView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/9/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboardingP2: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Image(colorScheme == .light ? "create.logo" : "create.logo.dark")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Account Sign-Up")
                .bold()
                .font(.title)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all)
            
            // MARK: Sign in with Apple
            Button(action: {
                SignInWithApple.instance.startSignInWithAppleFlow()
            }, label: {
                SignInWithAppleButtonCustom()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            })
                .padding(.horizontal, 50)
            
            // MARK: Sign in with Google
            Button(action: {
                showOnboardingP2.toggle()
            }, label: {
                HStack {
                    
                    Image(systemName: "globe")
                    
                    Text("Sign In with Google")
                    
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(6)
                .font(.system(size: 23, weight: .medium, design: .default))
                .padding(.horizontal, 50)
                
            })
                .accentColor(Color.white)
            
            Button(action: {
                
            }, label: {
                Text("Sign Up with Email")
                    .font(.system(size: 23, weight: .medium, design: .default))
            })
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Continue as guest".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            })
                .accentColor(.black)
        })
            .fullScreenCover(isPresented: $showOnboardingP2,
                             content: {
                OnboardingViewP2()
            })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
