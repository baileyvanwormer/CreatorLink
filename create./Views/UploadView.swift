//
//  UploadView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/5/22.
//

import UIKit
import SwiftUI

struct UploadView: View {
    
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage = UIImage(named: "blue1")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var showPostImageView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                
                Button(
                    action: {
                        sourceType = UIImagePickerController.SourceType.camera
                        showImagePicker.toggle()
                    },
                    label: {
                        Text("TAKE PHOTO")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                })
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.white)
                
                Button(
                    action: {
                        sourceType = UIImagePickerController.SourceType.photoLibrary
                        showImagePicker.toggle()
                    },
                    label: {
                        Text("IMPORT PHOTO")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                })
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.white)
            }
            .edgesIgnoringSafeArea(.all)
            
            .sheet(isPresented: $showImagePicker, onDismiss: segueToPostImageView, content: {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
        }) 
            Image("create.logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 12)
                .fullScreenCover(isPresented: $showPostImageView, content: {
                    PostImageView(imageSelected: $imageSelected)
                })
        }
    }
    
    // MARK: Functions
    
    func segueToPostImageView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showPostImageView.toggle()
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
