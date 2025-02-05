//
//  CatDetailViewModel.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI
import Combine

class CatDetailViewModel: ObservableObject {
    @Published var cat: CatDetail?
    private let useCase: UseCatListRepository
    private var cancellables = Set<AnyCancellable>()
    private let catID: String
    
    init(useCase: UseCatListRepository, catID: String) {
        self.useCase = useCase
        self.catID = catID
        fetchCatDetails()
    }
    
    func fetchCatDetails() {
        useCase.fetchCatDetail(id: catID)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.cat = nil
                    }
                },
                receiveValue: { [weak self] cat in
                    self?.cat = cat
                }
            )
            .store(in: &cancellables)
    }
}

