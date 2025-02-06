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
                    .accessibilityIdentifier("catImageView")
                
                Text(viewModel.cat?.name ?? K.Strings.unknown)
                    .font(.title)
                    .bold()
                    .accessibilityIdentifier("detailViewTitle")
                
                Text(viewModel.cat?.description ?? K.Strings.noDescription)
                    .font(.body)
                    .foregroundColor(.gray)
                    .accessibilityIdentifier("detailViewDescription")
                
                CatInfoView(title: K.Strings.origin, value: viewModel.cat?.origin ?? K.Strings.unknown)
                    .accessibilityIdentifier("Origin")
                CatInfoView(title: K.Strings.lifeSpan, value: "\(viewModel.cat?.lifeSpan ?? K.Strings.notAvailable) \(K.Strings.years)")
                    .accessibilityIdentifier("Life Span")
                CatInfoView(title: K.Strings.temperament, value: viewModel.cat?.temperament ?? K.Strings.unknown)
                    .accessibilityIdentifier("Temperament")
                
                CatStatsView(viewModel: viewModel)
                
                MoreInfoView(viewModel: viewModel)
                    .padding(.top)
            }
            .padding()
        }
        .navigationTitle(viewModel.cat?.name ??  K.Strings.detailTitle)
        .accessibilityIdentifier("detailView")
    }
}

#Preview {
    DetailView(catId: "")
}
