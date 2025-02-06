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
        guard let url = URL(string: K.API.baseURL) else {
            fatalError("⚠️ BASE_URL Invalid on Info.plist")
        }
        return url
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
        var headers: [String: String] = [
            "Content-Type": "application/json"
        ]        
        headers["x-api-key"] = K.API.apiKey
        
        return headers
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
