//
//  URLSessionMock.swift
//  EXSquaredTestAppTests
//
//  Created by bryangarcia on 5/2/25.
//

import Foundation

class URLSessionMock: URLSession {
    private let mockData: Data?
    private let mockResponse: URLResponse?
    private let mockError: Error?

    init(data: Data?, response: URLResponse?, error: Error?) {
        self.mockData = data
        self.mockResponse = response
        self.mockError = error
    }

    override func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            if let error = self.mockError {
                completionHandler(nil, self.mockResponse, error)
            } else {
                completionHandler(self.mockData, self.mockResponse, nil)
            }
        }
    }
}

class URLSessionDataTaskMock: URLSessionDataTask {
    private let mockCompletion: () -> Void

    init(completion: @escaping () -> Void) {
        self.mockCompletion = completion
    }

    override func resume() {
        DispatchQueue.global().async {
            self.mockCompletion()
        }
    }
}

