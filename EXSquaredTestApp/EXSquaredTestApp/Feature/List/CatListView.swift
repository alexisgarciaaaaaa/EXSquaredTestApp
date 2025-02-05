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
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage).foregroundColor(.red)
                } else {
                    ForEach(viewModel.cats) { cat in
                        ZStack {
                            ListItemView(cat: cat)
                            NavigationLink(destination: DetailView(catId: cat.id)) {
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle())
                            .opacity(0)
                        }
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
            .onAppear(perform: viewModel.firstLoad)
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .navigationTitle("Cat Breeds")
        }
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
