//
//  CatAPI.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI


enum CatAPI: APIEndpoint{
    case fetchCatList(params: CatRequest)
    
    var baseURL: URL {
        return URL(string: "https://api.thecatapi.com/v1/")!
    }
    
    var path: String {
        switch self {
        case .fetchCatList:
            return "breeds"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchCatList:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchCatList:
            return [
                "Content-type": "application/json",
                "x-api-key": "live_m1fWbID5o7yaDpBcOSsNOCNbfyYInELyHqspc1g4vW4mjCCN9VeGamxn8zZlfM0d"
            ]
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .fetchCatList(let params):
            return [
                "limit": params.limit,
                "page": params.page
            ]
        }
    }
    
    func bodyToData() throws -> Data? {
        switch self {
        case .fetchCatList:
            return nil
        }
    }
    
}
