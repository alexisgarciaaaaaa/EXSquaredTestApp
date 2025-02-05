//
//  CatImageView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct CatImageView: View {
    let imageUrl: String?

    var body: some View {
        AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\(imageUrl ?? "").jpg")) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .padding(.horizontal)
            case .failure(_):
                NoImageView()
            case .empty:
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            @unknown default:
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 4)
    }
}
