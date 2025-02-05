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
                if viewModel.isLoading {
                    LoadingView()
                } else if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage)
                } else {
                    catListSection
                }
            }
            .onAppear(perform: viewModel.firstLoad)
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .navigationTitle("Cat Breeds")
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
