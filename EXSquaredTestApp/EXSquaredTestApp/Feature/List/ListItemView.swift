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
            
            AsyncImage(url: URL(string: cat.image.url)) { image in
                image.resizable()
                     .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(cat.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(cat.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cat.temperament.split(separator: ",").map { String($0) }, id: \..self) { trait in
                            Text(trait.trimmingCharacters(in: .whitespaces))
                                .font(.caption)
                                .padding(6)
                                .background(Color.blue.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                
                HStack {
                    Label("\(cat.lifeSpan) años", systemImage: "clock")
                    Label("Energía: \(cat.energyLevel)", systemImage: "bolt.fill")
                    Label("Adaptabilidad: \(cat.adaptability)", systemImage: "heart.fill")
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 5)
    }
}

#Preview {
    ListItemView(cat: Cat(
        id: "abys",
        name: "Abyssinian",
        description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
        temperament: "Active, Energetic, Independent, Intelligent, Gentle",
        lifeSpan: "14 - 15",
        energyLevel: 5,
        adaptability: 5,
        image: CatImage(url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
    ))
    .previewLayout(.sizeThatFits)
}



// Modelo para el gato
struct Cat: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let temperament: String
    let lifeSpan: String
    let energyLevel: Int
    let adaptability: Int
    let image: CatImage
}

struct CatImage: Codable {
    let url: String
}
