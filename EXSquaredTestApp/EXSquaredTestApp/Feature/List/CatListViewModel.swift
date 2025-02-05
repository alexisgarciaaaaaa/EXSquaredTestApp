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
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    @Published private(set) var isFetchingMore: Bool = false
    @Published private(set) var isFirstLoad = true
    
    private let useCase: UseCatListRepository
    private var cancellables = Set<AnyCancellable>()
    private var currentPage = 1
    private let limit = 10
    private var hasMoreCats = true
    
    init(useCase: UseCatListRepository) {
        self.useCase = useCase
    }
    
    func fetchCats() {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        currentPage = 1
        hasMoreCats = true
        
        useCase.fetchCatList(params: CatRequest(limit: limit, page: currentPage))
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { [weak self] _ in
                self?.isLoading = false
            })
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] cats in
                    self?.cats = cats
                }
            )
            .store(in: &cancellables)
    }
    
    func fetchMoreCats() {
        guard !isFetchingMore, hasMoreCats else { return }
        isFetchingMore = true
        currentPage += 1
        
        useCase.fetchCatList(params: CatRequest(limit: limit, page: currentPage))
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
                    if newCats.isEmpty {
                        self.hasMoreCats = false
                    } else {
                        self.cats.append(contentsOf: newCats)
                    }
                }
            )
            .store(in: &cancellables)
    }

    func firstLoad() {
        if isFirstLoad {
            fetchCats()
            isFirstLoad = false
        }
    }
}
