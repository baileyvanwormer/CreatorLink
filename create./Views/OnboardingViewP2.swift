//
//  OnboardingViewP2.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/9/22.
//

import SwiftUI

struct OnboardingViewP2: View {
    
    @State var displayName: String = ""
    @State var showImagePicker: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    
    // MARK: For Image Picker
    @State var imageSelected: UIImage = UIImage(named: "blue1")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Text("What's your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            TextField("Add your name here...", text: $displayName)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
                .padding(.horizontal)
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                Text("Finish: Add profile picture")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
            })
                .opacity(displayName != "" ? 1.0 : 0.0)
                .animation(.easeOut(duration: 1.0))
            
        })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $showImagePicker, onDismiss: createProfile,
                   content: {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
            })
    }
    
    // MARK: FUNCTIONS
    
    func createProfile() {
        print("CREATE PROFILE NOW")
    }
}

struct OnboardingViewP2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewP2()
    }
}
