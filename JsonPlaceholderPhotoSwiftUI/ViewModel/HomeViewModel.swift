//
//  HomeViewModel.swift
//  JsonPlaceholderPhotoSwiftUI
//
//  Created by Toan Pham on 6/20/22.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    @Published var error: Error?
    
    private var photosSubscription: AnyCancellable?
    
    func getData(){
        APIHandler.shared.getData()
        guard let photosPublisher = APIHandler.shared.photosPublisher else {
            return
        }
        
        photosSubscription = photosPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("error: \(error)")
                }
            } receiveValue: { receivedPhotos in
                self.photos = receivedPhotos
            }
    }
}
