//
//  NewAccountView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/9/22.
//

import SwiftUI

struct NewAccountView: View {
    
    @State var showOnboarding: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Image(colorScheme == .light ? "create.logo" : "create.logo.dark")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            Spacer()
            
            Text("You're not signed in!")
                .font(.title)
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
                Text("Sign In".uppercased())
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
