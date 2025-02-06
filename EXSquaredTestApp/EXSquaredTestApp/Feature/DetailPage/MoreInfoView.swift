//
//  MoreInfoView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct MoreInfoView: View {
    @ObservedObject var viewModel: CatDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(K.Strings.moreInfo)
                .font(.headline)
            
            if let url = URL(string: viewModel.cat?.wikipediaURL ?? ""), UIApplication.shared.canOpenURL(url) {
                Link(K.Strings.wikipedia, destination: url)
            }
            if let url = URL(string: viewModel.cat?.cfaURL ?? ""), UIApplication.shared.canOpenURL(url) {
                Link(K.Strings.cfa, destination: url)
            }
            if let url = URL(string: viewModel.cat?.vetstreetURL ?? ""), UIApplication.shared.canOpenURL(url) {
                Link(K.Strings.vetstreet, destination: url)
            }
            if let url = URL(string: viewModel.cat?.vcahospitalsURL ?? ""), UIApplication.shared.canOpenURL(url) {
                Link(K.Strings.vcaHospitals, destination: url)
            }
        }
    }
}
