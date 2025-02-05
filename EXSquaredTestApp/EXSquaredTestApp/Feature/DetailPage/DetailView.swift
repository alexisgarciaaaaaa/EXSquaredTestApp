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
                AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\(viewModel.cat?.referenceImageID ?? "").jpg")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .padding(.horizontal)
                        
                    case .failure(_), .empty:
                        NoImageView()
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    @unknown default:
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 4)
                
                Text(viewModel.cat?.name ?? "")
                    .font(.title)
                    .bold()
                
                Text(viewModel.cat?.description ?? "")
                    .font(.body)
                    .foregroundColor(.gray)
                
                CatInfoView(title: "Origin", value: viewModel.cat?.origin ?? "")
                CatInfoView(title: "Life Span", value: "\(viewModel.cat?.lifeSpan ?? "") years")
                CatInfoView(title: "Temperament", value: viewModel.cat?.temperament ?? "")
                
                VStack(spacing: 8) {
                    StatView(title: "Adaptability", value: viewModel.cat?.adaptability ?? 0)
                    StatView(title: "Affection Level", value: viewModel.cat?.affectionLevel ?? 0)
                    StatView(title: "Child Friendly", value: viewModel.cat?.childFriendly ?? 0)
                    StatView(title: "Dog Friendly", value: viewModel.cat?.dogFriendly ?? 0)
                    StatView(title: "Intelligence", value: viewModel.cat?.intelligence ?? 0)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("More Info")
                        .font(.headline)
                    if let wikiURL = viewModel.cat?.wikipediaURL {
                        Link("Wikipedia", destination: URL(string: wikiURL)!)
                    }
                    if let CFA = viewModel.cat?.cfaURL {
                        Link("CFA", destination: URL(string: CFA)!)
                    }
                    if let Vetstreet = viewModel.cat?.vetstreetURL {
                        Link("Vetstreet", destination: URL(string: Vetstreet)!)
                    }
                    if let VCA = viewModel.cat?.vcahospitalsURL {
                        Link("VCA Hospitals", destination: URL(string: VCA)!)
                    }
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle(viewModel.cat?.name ?? "")
    }
}

#Preview {
    DetailView(catId: "")
}
