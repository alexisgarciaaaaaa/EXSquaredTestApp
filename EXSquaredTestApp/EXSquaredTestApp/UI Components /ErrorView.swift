//
//  ErrorView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .padding()
    }
}

#Preview {
    ErrorView(message: "")
}
