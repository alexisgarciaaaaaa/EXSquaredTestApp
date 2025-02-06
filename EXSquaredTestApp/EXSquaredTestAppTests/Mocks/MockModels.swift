//
//  MockModels.swift
//  EXSquaredTestAppTests
//
//  Created by bryangarcia on 5/2/25.
//

@testable import EXSquaredTestApp

extension Cat {
    static func mock(
        id: String = "1",
        name: String? = "Siamese",
        description: String? = "A lovely test cat",
        temperament: String? = "Friendly, Playful",
        lifeSpan: String? = "12-15",
        energyLevel: Int? = 4,
        adaptability: Int? = 5,
        image: CatImage? = CatImage.mock()
    ) -> Cat {
        return Cat(
            id: id,
            name: name,
            description: description,
            temperament: temperament,
            lifeSpan: lifeSpan,
            energyLevel: energyLevel,
            adaptability: adaptability,
            image: image
        )
    }
}

extension CatImage {
    static func mock(url: String = "https://example.com/image.jpg") -> CatImage {
        return CatImage(url: url)
    }
}

extension CatDetail {
    static func mock(
        id: String = "1",
        name: String? = "Maine Coon",
        cfaURL: String? = "https://www.cfa.org/siamese",
        vetstreetURL: String? = "https://www.vetstreet.com/cats/siamese",
        vcahospitalsURL: String? = "https://vcahospitals.com/siamese",
        temperament: String? = "Curious, Playful",
        origin: String? = "Thailand",
        description: String? = "A smart and active cat",
        lifeSpan: String? = "12-15",
        adaptability: Int? = 5,
        affectionLevel: Int? = 5,
        childFriendly: Int? = 4,
        dogFriendly: Int? = 3,
        intelligence: Int? = 5,
        wikipediaURL: String? = "https://en.wikipedia.org/wiki/Siamese_cat",
        referenceImageID: String? = "siamese_123"
    ) -> CatDetail {
        return CatDetail(
            id: id,
            name: name,
            cfaURL: cfaURL,
            vetstreetURL: vetstreetURL,
            vcahospitalsURL: vcahospitalsURL,
            temperament: temperament,
            origin: origin,
            description: description,
            lifeSpan: lifeSpan,
            adaptability: adaptability,
            affectionLevel: affectionLevel,
            childFriendly: childFriendly,
            dogFriendly: dogFriendly,
            intelligence: intelligence,
            wikipediaURL: wikipediaURL,
            referenceImageID: referenceImageID
        )
    }
}

