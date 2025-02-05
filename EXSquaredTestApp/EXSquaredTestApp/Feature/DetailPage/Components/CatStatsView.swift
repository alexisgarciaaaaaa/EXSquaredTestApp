//
//  CatStatsView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct CatStatsView: View {
    @ObservedObject var viewModel: CatDetailViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            StatView(title: "Adaptability", value: viewModel.cat?.adaptability ?? 0)
            StatView(title: "Affection Level", value: viewModel.cat?.affectionLevel ?? 0)
            StatView(title: "Child Friendly", value: viewModel.cat?.childFriendly ?? 0)
            StatView(title: "Dog Friendly", value: viewModel.cat?.dogFriendly ?? 0)
            StatView(title: "Intelligence", value: viewModel.cat?.intelligence ?? 0)
        }
    }
}
