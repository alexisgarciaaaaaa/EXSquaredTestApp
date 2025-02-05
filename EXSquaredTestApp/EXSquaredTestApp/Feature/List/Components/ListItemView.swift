//
//  ListItemView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct ListItemView: View {
    
    let cat: Cat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let imageURL = cat.image?.url {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.resizable()
                         .scaledToFill()
                         .frame(width: UIScreen.main.bounds.width - 50, height: 200)
                         .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width - 50, height: 200)
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                NoImageView()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(cat.name ?? "hola")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(cat.description ?? "test")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cat.temperament?.split(separator: ",").map { String($0) } ?? [], id: \.self) { trait in
                            Text(trait.trimmingCharacters(in: .whitespaces))
                                .font(.caption)
                                .padding(6)
                                .background(Color.blue.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                
                HStack {
                    Label("\(cat.lifeSpan ?? "") years", systemImage: "clock")
                    Label("Energy: \(cat.energyLevel ?? 0)", systemImage: "bolt.fill")
                    Label("Adpt: \(cat.adaptability ?? 0)", systemImage: "heart.fill")
                }
                .font(.caption)
                .foregroundColor(.gray)
                
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 50)
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 5)
    }
}
