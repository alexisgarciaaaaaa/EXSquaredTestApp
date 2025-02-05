//
//  DetailView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel: CatDetailViewModel
    
    init(catId: String) {
        _viewModel = StateObject(wrappedValue: CatDetailViewModel(useCase: UseCatListService(), catID: catId))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                CatImageView(imageUrl: viewModel.cat?.referenceImageID ?? "")
                
                Text(viewModel.cat?.name ?? "Unknown")
                    .font(.title)
                    .bold()
                
                Text(viewModel.cat?.description ?? "No description available")
                    .font(.body)
                    .foregroundColor(.gray)
                
                CatInfoView(title: "Origin", value: viewModel.cat?.origin ?? "Unknown")
                CatInfoView(title: "Life Span", value: "\(viewModel.cat?.lifeSpan ?? "N/A") years")
                CatInfoView(title: "Temperament", value: viewModel.cat?.temperament ?? "Unknown")
                
                CatStatsView(viewModel: viewModel)
                
                MoreInfoView(viewModel: viewModel)
                    .padding(.top)
            }
            .padding()
        }
        .navigationTitle(viewModel.cat?.name ?? "Detail")
    }
}

#Preview {
    DetailView(catId: "")
}
