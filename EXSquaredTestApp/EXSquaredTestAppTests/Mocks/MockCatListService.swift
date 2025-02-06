//
//  MockCatListService.swift
//  EXSquaredTestAppTests
//
//  Created by bryangarcia on 5/2/25.
//

import Foundation
import Combine
@testable import EXSquaredTestApp

class MockCatListService: UseCatListRepository {
    
    var initialResponse: [Cat] = []
    var moreCatsResponse: [Cat] = []
    var shouldReturnError = false
    var mockDetailResponse: CatDetail?
    private var isFirstCall = true
    
    func fetchCatList(params: CatRequest) -> AnyPublisher<[Cat], Error> {
        if shouldReturnError {
            return Fail(error: NSError(domain: "MockError", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }
        
        if isFirstCall {
            isFirstCall = false
            return Just(initialResponse)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Just(moreCatsResponse)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
    
    func fetchCatDetail(id: String) -> AnyPublisher<CatDetail, Error> {
        if shouldReturnError {
            return Fail(error: NSError(domain: "MockError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked error"]))
                .eraseToAnyPublisher()
        }
        
        if let detail = mockDetailResponse {
            return Just(detail)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "MockError", code: -2, userInfo: nil))
                .eraseToAnyPublisher()
        }
    }
}
