//
//  CatDetailModel.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct CatDetail: Codable, Identifiable {
    let id: String
    let name: String?
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let temperament: String?
    let origin: String?
    let description: String?
    let lifeSpan: String?
    let adaptability: Int?
    let affectionLevel: Int?
    let childFriendly: Int?
    let dogFriendly: Int?
    let intelligence: Int?
    let wikipediaURL: String?
    let referenceImageID: String?

    enum CodingKeys: String, CodingKey {
        case id, name, temperament, origin, description
        case lifeSpan = "life_span", cfaURL = "cfa_url", vetstreetURL = "vetstreet_url", vcahospitalsURL = "vcahospitals_url"
        case adaptability, affectionLevel = "affection_level", childFriendly = "child_friendly", dogFriendly = "dog_friendly"
        case intelligence, wikipediaURL = "wikipedia_url", referenceImageID = "reference_image_id"
    }
}
