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
                         .frame(width: UIScreen.main.bounds.width - 50, height: 200) // Ajustando el ancho
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



// Modelo para el gato
struct Cat: Identifiable, Codable {
    let id: String
    let name: String?
    let description: String?
    let temperament: String?
    let lifeSpan: String?
    let energyLevel: Int?
    let adaptability: Int?
    let image: CatImage?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, temperament, image
        case lifeSpan = "life_span"  // Mapea "life_span" del JSON a "lifeSpan"
        case energyLevel = "energy_level"
        case adaptability
    }
}

struct CatImage: Codable {
    let url: String?
}


struct NoImageView: View {
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            
            Text("No Image Available")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 200)
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
