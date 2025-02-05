//
//  UseCatListRepository.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI
import Combine

protocol UseCatListRepository {
    func fetchCatList(params: CatRequest) -> AnyPublisher<[Cat], Error>
    func fetchCatDetail(id: String) -> AnyPublisher<CatDetail, Error>
}
