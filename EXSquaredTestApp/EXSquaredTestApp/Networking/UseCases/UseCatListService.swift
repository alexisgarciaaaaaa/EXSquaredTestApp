//
//  UseCatListService.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI
import Combine

class UseCatListService: UseCatListRepository {
    let apiCLient = URLSessionAPIClient<CatAPI>()
    
    func fetchCatList(params: CatRequest) -> AnyPublisher<[Cat], Error> {
        return apiCLient.request(.fetchCatList(params: params))
    }
    
    func fetchCatDetail(id: String) -> AnyPublisher<CatDetail, Error> {
        return apiCLient.request(.fetchCatDetail(id: id))
    }
}


class MockCatListService: UseCatListRepository {
    func fetchCatList(params: CatRequest) -> AnyPublisher<[Cat], Error> {
        let mockCats = [
            Cat(
                id: "1",
                name: "Siamese",
                description: "Smart and active",
                temperament: "Curious, Playful",
                lifeSpan: "12-15",
                energyLevel: 4,
                adaptability: 5,
                image: CatImage(url: "https://example.com/siamese.jpg")
            ),
            Cat(
                id: "2",
                name: "Persian",
                description: "Smart and active",
                temperament: "Curious, Playful",
                lifeSpan: "12-15",
                energyLevel: 4,
                adaptability: 5,
                image: CatImage(url: "https://example.com/siamese.jpg")
            ),
            Cat(
                id: "3",
                name: "Maine Coon",
                description: "Smart and active",
                temperament: "Curious, Playful",
                lifeSpan: "12-15",
                energyLevel: 4,
                adaptability: 5,
                image: CatImage(url: "https://example.com/siamese.jpg")
            )
        ]
        return Just(mockCats)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func fetchCatDetail(id: String) -> AnyPublisher<CatDetail, Error> {
        let mockDetail = CatDetail(id: "1",
                                   name: "Maine Coon",
                                   cfaURL: "https://www.cfa.org/siamese",
                                   vetstreetURL: "https://www.vetstreet.com/cats/siamese",
                                   vcahospitalsURL: "https://vcahospitals.com/siamese",
                                   temperament: "Curious, Playful",
                                   origin: "Thailand",
                                   description: "A smart and active cat",
                                   lifeSpan: "12-15",
                                   adaptability: 5,
                                   affectionLevel: 5,
                                   childFriendly: 4,
                                   dogFriendly: 3,
                                   intelligence: 5,
                                   wikipediaURL: "https://en.wikipedia.org/wiki/Siamese_cat",
                                   referenceImageID: "siamese_123")
        return Just(mockDetail)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
