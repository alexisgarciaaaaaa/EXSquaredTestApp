//
//  CatListViewModel.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI
import Combine

class CatListViewModel: ObservableObject {
    @Published private(set) var cats: [Cat] = []
    @Published private(set) var loadingState: LoadingState = .idle
    @Published private(set) var isFetchingMore: Bool = false
    @Published private(set) var errorMessage: String?
    
    private let useCase: UseCatListRepository
    private var cancellables = Set<AnyCancellable>()
    private var paginationHandler = PaginationHandler()
    
    init(useCase: UseCatListRepository) {
        self.useCase = useCase
    }
    
    func fetchCats() {
        guard case .idle = loadingState else { return }
        loadingState = .loading
        errorMessage = nil
        paginationHandler.reset()
        
        useCase.fetchCatList(params: CatRequest(limit: paginationHandler.limit, page: 1))
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    self.loadingState = .idle
                    if case .failure(let error) = completion {
                        self.errorMessage = error.localizedDescription
                        self.loadingState = .error(error.localizedDescription)
                    }
                },
                receiveValue: { [weak self] cats in
                    self?.cats = cats
                    self?.paginationHandler.updateHasMore(!cats.isEmpty)
                    self?.loadingState = .loaded
                }
            )
            .store(in: &cancellables)
    }
    
    func fetchMoreCats() {
        guard let nextPage = paginationHandler.nextPage(), !isFetchingMore else { return }
        isFetchingMore = true
        
        useCase.fetchCatList(params: CatRequest(limit: paginationHandler.limit, page: nextPage))
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isFetchingMore = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] newCats in
                    guard let self = self else { return }
                    self.cats.append(contentsOf: newCats)
                    self.paginationHandler.updateHasMore(!newCats.isEmpty)
                }
            )
            .store(in: &cancellables)
    }
}

import Foundation

class PaginationHandler {
    private(set) var currentPage = 1
    let limit: Int
    private var hasMoreCats = true

    init(limit: Int = 10) {
        self.limit = limit
    }

    func nextPage() -> Int? {
        guard hasMoreCats else { return nil }
        currentPage += 1
        return currentPage
    }

    func reset() {
        currentPage = 1
        hasMoreCats = true
    }

    func updateHasMore(_ hasMore: Bool) {
        hasMoreCats = hasMore
    }
}


enum LoadingState {
    case idle
    case loading
    case loaded
    case error(String)
}
