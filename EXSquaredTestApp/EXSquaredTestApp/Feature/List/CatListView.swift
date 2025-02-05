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
        List {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage).foregroundColor(.red)
            } else {
                ForEach(viewModel.cats) { cat in
                    ListItemView(cat: cat)
                        .onAppear {
                            if cat == viewModel.cats.last {
                                viewModel.fetchMoreCats()
                            }
                        }
                }
                
                if viewModel.isFetchingMore {
                    ProgressView()
                        .padding()
                }
            }
        }
        .onAppear {
            viewModel.fetchCats()
        }
        .listStyle(PlainListStyle()) // Cambia el estilo de la lista
        .background(Color.clear) // Elimina fondo gris
    }
}

#Preview {
    CatListView(viewModel: CatListViewModel(useCase: UseCatListService()))
}


extension Cat: Equatable {
    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id
    }
}
