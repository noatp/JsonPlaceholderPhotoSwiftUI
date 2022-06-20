//
//  ContentView.swift
//  JsonPlaceholderPhotoSwiftUI
//
//  Created by Toan Pham on 6/20/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel = .init()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(homeViewModel.photos) { photo in
                        NavigationLink  {
                            DetailView(photo: photo)
                        } label: {
                            PhotoCardView(photo: photo)
                        }
                        .foregroundColor(.black)
                    }
                
                }
            }
            .navigationTitle("Photos")
        }
        
        .onAppear{
            homeViewModel.getData()
        }
    }
}

struct PhotoCardView: View {
    let photo: Photo
    
    var body: some View {
        HStack {
            if let urlString = photo.thumbnailUrl {
                WebImage(url: URL(string: urlString))
                    .cancelOnDisappear(true)
                    .placeholder(content: {
                        ProgressView()
                    })
                    .transition(.fade(duration: 0.5))
            }
            VStack(alignment: .leading){
                Text(photo.title ?? "")
                    .font(.system(size: 20, weight: .bold, design: .default))
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
