//
//  ListItemModel.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import Foundation

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
        case lifeSpan = "life_span"
        case energyLevel = "energy_level"
        case adaptability
    }
}

struct CatImage: Codable {
    let url: String?
}
