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
                CachedAsyncImage(url: imageURL)
                    .frame(width: K.UIConfig.cardWidth, height: K.UIConfig.cardHeight)
                    .clipShape(RoundedRectangle(cornerRadius: K.UIConfig.cardCornerRadius))
            } else {
                NoImageView()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(cat.name ?? K.Strings.defaultCatName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(cat.description ?? K.Strings.defaultDescription)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cat.temperament?.split(separator: ",").map { String($0) } ?? [], id: \.self) { trait in
                            Text(trait.trimmingCharacters(in: .whitespaces))
                                .font(.caption)
                                .padding(K.UIConfig.tagPadding)
                                .background(Color.blue.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                
                HStack {
                    Label("\(cat.lifeSpan ?? "") \(K.Strings.yearsLabel)", systemImage: "clock")
                    Label("\(K.Strings.energyLabel) \(cat.energyLevel ?? 0)", systemImage: "bolt.fill")
                    Label("\(K.Strings.adaptabilityLabel) \(cat.adaptability ?? 0)", systemImage: "heart.fill")
                }
                .font(.caption)
                .foregroundColor(.gray)
                
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: K.UIConfig.cardWidth)
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: K.UIConfig.cardCornerRadius))
        .shadow(radius: K.UIConfig.shadowRadius)
    }
}
