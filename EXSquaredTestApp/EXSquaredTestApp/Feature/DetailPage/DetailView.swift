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
        let isUITesting = ProcessInfo.processInfo.arguments.contains("--uitesting")
        let mockService = MockCatListService()
        let viewModel = CatDetailViewModel(useCase: isUITesting ? mockService : UseCatListService(), catID: catId)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                CatImageView(imageUrl: viewModel.cat?.referenceImageID ?? "")
                    .accessibilityIdentifier(K.AccessibilityIdentifiers.catImageView)
                
                Text(viewModel.cat?.name ?? K.Strings.unknown)
                    .font(.title)
                    .bold()
                    .accessibilityIdentifier(K.AccessibilityIdentifiers.detailViewTitle)
                
                Text(viewModel.cat?.description ?? K.Strings.noDescription)
                    .font(.body)
                    .foregroundColor(.gray)
                    .accessibilityIdentifier(K.AccessibilityIdentifiers.detailViewDescription)
                
                CatInfoView(title: K.Strings.origin, value: viewModel.cat?.origin ?? K.Strings.unknown)
                    .accessibilityIdentifier(K.AccessibilityIdentifiers.detailViewOrigin)
                
                CatInfoView(title: K.Strings.lifeSpan, value: "\(viewModel.cat?.lifeSpan ?? K.Strings.notAvailable) \(K.Strings.years)")
                    .accessibilityIdentifier(K.AccessibilityIdentifiers.detailViewLifeSpan)
                
                CatInfoView(title: K.Strings.temperament, value: viewModel.cat?.temperament ?? K.Strings.unknown)
                    .accessibilityIdentifier(K.AccessibilityIdentifiers.detailViewTemperament)
                
                CatStatsView(viewModel: viewModel)
                
                MoreInfoView(viewModel: viewModel)
                    .padding(.top)
            }
            .padding()
        }
        .navigationTitle(viewModel.cat?.name ?? K.Strings.detailTitle)
        .accessibilityIdentifier(K.AccessibilityIdentifiers.detailView)
    }
}


#Preview {
    DetailView(catId: "")
}
