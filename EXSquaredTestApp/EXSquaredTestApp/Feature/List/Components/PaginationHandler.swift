//
//  PaginationHandler.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

class PaginationHandler {
    private(set) var currentPage = K.Pagination.initialPage
    let limit: Int
    private var hasMoreCats = true

    init(limit: Int = K.Pagination.defaultLimit) {
        self.limit = limit
    }

    func nextPage() -> Int? {
        guard hasMoreCats else { return nil }
        currentPage += 1
        return currentPage
    }

    func reset() {
        currentPage = K.Pagination.initialPage
        hasMoreCats = true
    }

    func updateHasMore(_ hasMore: Bool) {
        hasMoreCats = hasMore
    }
}


enum LoadingState: Equatable {
    case idle
    case loading
    case loaded
    case error(String)
}

