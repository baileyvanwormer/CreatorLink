//
//  SettingsView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/9/22.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                
                //MARK: Section 1: Create.
                GroupBox(label: SettingsLabelView(labelText: "Create.", labelImage: "dot.radiowaves.left.and.right"), content: {
                    HStack(alignment: .center, spacing: 10, content: {
                        
                        Image("create.banner.transparent")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(12)
                        
                        Text("CreatorLink is a community for creators to meet, grow, and share.")
                            .font(.footnote)
                    })
                })
                    .padding()
                
                // MARK: Section 2: Profile
                GroupBox(label: SettingsLabelView(labelText: "Profile", labelImage: "person.fill"), content: {
                    
                    NavigationLink(
                        destination: SettingsEditTextView(submissionText: "Current Display Name", title: "Display Name", description: "You can edit your display name here. This will be seen by other users on your profile.", placeholder: "Type your display name..."),
                                   label: {
                        SettingsRowView(leftIcon: "pencil", text: "Display Name", color: .blue)
                    })
                    
                    NavigationLink(destination: {
                        SettingsEditTextView(submissionText: "Current bio here", title: "Profile Bio", description: "Tell creators who you are!", placeholder: "Your bio here...")
                    }, label: {
                        SettingsRowView(leftIcon: "text.quote", text: "Bio", color: .blue)
                    })
                    
                    NavigationLink(destination: SettingsEditImageView(title: "Profile Picture", description: "Your profile picture", selectedImage: UIImage(named: "blue1")!),
                                   label: {
                        SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: .blue)
                    })
                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Sign Out", color: .blue)
                })
                    .padding()
                
                // MARK: SECTION 3: Application
                GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: .blue)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms and Conditions", color: .blue)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "globe", text: "CreatorLink Website", color: .blue)
                    })
                    
                })
                    .padding()
                
                // MARK: SECTION 4: Sign off
                GroupBox(content: {
                    
                    Text("CreatorLink \n Made in Chapel Hill \n All Rights Reserved \n CreatorLink Inc \n Copyright 2022")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                })
                    .padding()
                    .padding(.bottom, 80)
                
            })
                .navigationBarTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                })
                                        .accentColor(.primary)
                )
        }
    }
    
    // MARK: FUNCTIONS
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
            SettingsView()
    }
}
