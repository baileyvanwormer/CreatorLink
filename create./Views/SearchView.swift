//
//  SearchView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI

struct SearchView: View {
    
    var posts = PostArrayObject()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            CarouselView()
            ImageGridView(posts: posts)
        })
            .navigationBarTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
        }
    }
}
