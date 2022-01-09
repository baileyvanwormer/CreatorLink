//
//  NewAccountView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/9/22.
//

import SwiftUI

struct NewAccountView: View {
    
    @State var showOnboarding: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Image("create.logo")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("You're not signed in!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.primary)
            
            Text("Click the button below to create an account")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: {
                showOnboarding.toggle()
            }, label: {
                Text("Sign-In / SignUp".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.black)
                    .cornerRadius(12)
                    .shadow(radius: 12)
            })
                .accentColor(Color.white)
                .padding(.horizontal)
            
            Spacer()
            Spacer()
            
        })
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $showOnboarding, content: {
                OnboardingView()
            })
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
