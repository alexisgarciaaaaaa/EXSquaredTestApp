//
//  LoadingView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView(K.Strings.loadingText)
            .frame(maxWidth: .infinity)
            .padding()
            .multilineTextAlignment(.center)
    }
}

#Preview {
    LoadingView()
}
