//
//  CatAPI.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI


enum CatAPI: APIEndpoint{
    case fetchCatList(params: CatRequest)
    case fetchCatDetail(id: String)
    
    var baseURL: URL {
        return URL(string: "https://api.thecatapi.com/v1/")!
    }
    
    var path: String {
        switch self {
        case .fetchCatList:
            return "breeds"
        case .fetchCatDetail(let id):
            return "breeds/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchCatList:
            return .get
        case .fetchCatDetail:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchCatList, .fetchCatDetail:
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
        case .fetchCatDetail:
            return nil
        }
    }
    
    func bodyToData() throws -> Data? {
        switch self {
        case .fetchCatList, .fetchCatDetail:
            return nil
        }
    }
    
}
