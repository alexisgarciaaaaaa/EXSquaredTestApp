//
//  APIClient.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI
import Combine

protocol APIClient {
    associatedtype EndPointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndPointType) -> AnyPublisher<T, Error>
}

enum ApiError: Error {
    case invalidResponse
    case invalidData
}

class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    typealias EndPointType = EndpointType
    
    func request<T: Decodable>(_ endpoint: EndPointType) -> AnyPublisher<T, Error> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key)}
        
        if let bodyData = try? endpoint.bodyToData() {
            request.httpBody = bodyData
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on:DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                    throw ApiError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    
}
