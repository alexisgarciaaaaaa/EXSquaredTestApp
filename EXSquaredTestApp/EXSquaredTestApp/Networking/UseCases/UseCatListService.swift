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
}
