//
//  CachedAsyncImage.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct CachedAsyncImage: View {
    let url: String

    @State private var image: UIImage?
    @State private var isLoading: Bool = true

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: K.UIConfig.cardWidth,
                        height: K.UIConfig.cardHeight)
                    .clipped()
            } else if isLoading {
                ProgressView()
                    .frame(
                        width: K.UIConfig.cardWidth,
                        height: K.UIConfig.cardHeight)
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            loadImage()
        }
    }

    private func loadImage() {
        ImageCacheManager.shared.getImage(from: url) { loadedImage in
            self.image = loadedImage
            self.isLoading = false
        }
    }
}
