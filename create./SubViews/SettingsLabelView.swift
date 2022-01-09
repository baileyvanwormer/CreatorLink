//
//  SettingsLabelView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/9/22.
//

import SwiftUI

struct SettingsLabelView: View {
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text("Label Title")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: labelImage)
                
            }
            
            Divider()
                .padding(.vertical, 4)
            
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Test Label", labelImage: "heart")
            .previewLayout(.sizeThatFits)
    }
}
