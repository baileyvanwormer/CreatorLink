//
//  OnboardingView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/9/22.
//

import SwiftUI
import FirebaseAuth

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboardingP2: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @State var showError: Bool = false
    
    @State var displayName: String = ""
    @State var email: String = ""
    @State var providerID: String = ""
    @State var provider: String = ""
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Image(colorScheme == .light ? "create.logo" : "create.logo.dark")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Account Sign-Up")
                .bold()
                .font(.title)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all)
            
            // MARK: Sign in with Apple
            Button(action: {
                SignInWithApple.instance.startSignInWithAppleFlow(view: self)
            }, label: {
                SignInWithAppleButtonCustom()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            })
                .padding(.horizontal, 50)
            
//            // MARK: Sign in with Google
//            Button(action: {
//                showOnboardingP2.toggle()
//            }, label: {
//                HStack {
//                    
//                    Image("google.light")
//                    
//                    Text("Sign in with Google")
//                    
//                }
//                .frame(height: 60)
//                .frame(maxWidth: .infinity)
//                .background(Color.white)
//                .cornerRadius(6)
//                .font(.system(size: 23, weight: .medium, design: .default))
//                .padding(.horizontal, 50)
//                .shadow(radius: 12)
//                
//            })
//                .accentColor(Color.primary)
//            
            Button(action: {
                
            }, label: {
                Text("Sign Up with Email")
                    .font(.system(size: 23, weight: .medium, design: .default))
            })
                .padding(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Continue as guest".uppercased())
                    .font(.callout)
                    .fontWeight(.medium)
                    .padding()
            })
                .accentColor(.black)
        })
            .fullScreenCover(isPresented: $showOnboardingP2,
                             onDismiss: {
                                 self.presentationMode.wrappedValue.dismiss()
                             }, content: {
                OnboardingViewP2(displayName: $displayName, email: $email, providerID: $providerID, provider: $provider)
            })
            .alert(isPresented: $showError, content: {
                return Alert(title: Text("Error signing in"))
            })
    }
    
    // MARK: Functions
    
    func connectToFirebase(name: String, email: String, provider: String, credential: AuthCredential) {
        
        AuthService.instance.logInUserToFirebase(credential: credential) { (returnedProviderID, isError) in
            if let providerID = returnedProviderID, !isError {
                // Success
                
                self.displayName = name
                self.email = email
                self.providerID = providerID
                self.provider = provider
                self.showOnboardingP2.toggle()
                
                
            } else {
                // Error
                print("Error logging in.")
                self.showError.toggle()
            }
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
