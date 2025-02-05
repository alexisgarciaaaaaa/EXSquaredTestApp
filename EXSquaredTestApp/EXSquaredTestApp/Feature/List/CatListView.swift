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
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                switch viewModel.loadingState {
                case .loading:
                    LoadingView()
                case .error(let message):
                    ErrorView(message: message)
                case .loaded, .idle:
                    catListSection
                }
            }
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
