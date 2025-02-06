//
//  CatListView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct CatListView: View {
    @StateObject private var viewModel: CatListViewModel
    
    init(viewModel: CatListViewModel = CatListViewModel(useCase: UseCatListService())) {
        let isUITesting = ProcessInfo.processInfo.arguments.contains("--uitesting")
                    let mockService = MockCatListService()
                    let viewModelInject = CatListViewModel(useCase: isUITesting ? mockService : UseCatListService())
        _viewModel = StateObject(wrappedValue: viewModelInject)
    }
    
    var body: some View {
        NavigationView {
            List {
                switch viewModel.loadingState {
                case .loading:
                    LoadingView()
                        .accessibilityIdentifier("loadingIndicator")
                case .error(let message):
                    ErrorView(message: message)
                        .accessibilityIdentifier("errorViewMessage")
                case .loaded, .idle:
                    catListSection
                }
            }
            .accessibilityIdentifier("catListView")
            .onAppear(perform: firstLoad)
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .navigationTitle(K.Strings.navigationTitle)
        }
    }

    private func firstLoad() {
        if viewModel.cats.isEmpty {
            viewModel.fetchCats()
        }
    }
}

// MARK: - CatListView Subviews

private extension CatListView {
    var catListSection: some View {
        Group {
            ForEach(viewModel.cats) { cat in
                CatListItemView(cat: cat)
                    .accessibilityIdentifier("catName_\(cat.id)")
                    .onAppear {
                        if cat == viewModel.cats.last {
                            viewModel.fetchMoreCats()
                        }
                    }
            }
            if viewModel.isFetchingMore {
                LoadingView()
            }
        }
    }
}

#Preview {
    CatListView(viewModel: CatListViewModel(useCase: UseCatListService()))
}
