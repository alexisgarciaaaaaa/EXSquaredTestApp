//
//  ListView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<20) { _ in
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
            }
        }
    }
}

#Preview {
    ListView()
}
