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
            StatView(
                title: K.Strings.adaptability,
                value: viewModel.cat?.adaptability ?? 0)
            StatView(
                title: K.Strings.affectionLevel,
                value: viewModel.cat?.affectionLevel ?? 0)
            StatView(
                title: K.Strings.childFriendly,
                value: viewModel.cat?.childFriendly ?? 0)
            StatView(
                title: K.Strings.dogFriendly,
                value: viewModel.cat?.dogFriendly ?? 0)
            StatView(
                title: K.Strings.intelligence,
                value: viewModel.cat?.intelligence ?? 0)
        }
    }
}
