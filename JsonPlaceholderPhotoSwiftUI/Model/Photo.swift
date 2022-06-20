//
//  Photo.swift
//  JsonPlaceholderPhotoSwiftUI
//
//  Created by Toan Pham on 6/20/22.
//

import Foundation

struct Photo: Decodable, Identifiable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
    
    static let preview: Photo = .init(
        albumId: 1,
        id: 1,
        title: "accusamus beatae ad facilis cum similique qui sunt",
        url: "https://via.placeholder.com/600/92c952",
        thumbnailUrl: "https://via.placeholder.com/150/92c952"
    )
}

