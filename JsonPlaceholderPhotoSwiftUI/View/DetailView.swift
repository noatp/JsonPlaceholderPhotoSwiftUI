//
//  DetailView.swift
//  JsonPlaceholderPhotoSwiftUI
//
//  Created by Toan Pham on 6/20/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    let photo: Photo
    var body: some View {
        VStack(alignment: .leading){
            if let urlString = photo.url {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .cancelOnDisappear(true)
                    .placeholder(content: {
                        ProgressView()
                    })
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
            }
            Text("Title: \(photo.title ?? "")")
                .font(.system(size: 17, weight: .bold, design: .default))
            Text("Id: \(photo.id ?? -1)")
            Text("AlbumId: \(photo.albumId ?? -1)")
            Spacer()
        }
        .navigationTitle("Detail")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(photo: .preview)
    }
}
