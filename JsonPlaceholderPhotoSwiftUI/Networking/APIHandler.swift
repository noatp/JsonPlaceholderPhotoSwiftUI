//
//  APIHandler.swift
//  JsonPlaceholderPhotoSwiftUI
//
//  Created by Toan Pham on 6/20/22.
//

import Foundation

import Foundation
import Combine

class APIHandler {
    static let shared: APIHandler = .init()
    
    var photosPublisher: AnyPublisher<[Photo], Error>?
    
    private init(){}
    
    func getData() {
        let url = URL(string: Constant.urlString)
        photosPublisher = URLSession.shared.dataTaskPublisher(for: url!)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
