//
//  MessageView.swift
//  create.
//
//  Created by Bailey Van Wormer on 1/5/22.
//

import SwiftUI

struct MessageView: View {
    
    @State var comment: CommentModel
    
    var body: some View {
        HStack {
            
            // MARK: PROFILE IMAGE
            Image("blue1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4, content: {
                
                // MARK: USER NAME
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: COMMENT
                Text(comment.content)
                    .padding(.all)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
                
                
            })
            
            Spacer(minLength: 0)
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    
    static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Joe Green", content: "This photo is really cool haha", dateCreated: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
