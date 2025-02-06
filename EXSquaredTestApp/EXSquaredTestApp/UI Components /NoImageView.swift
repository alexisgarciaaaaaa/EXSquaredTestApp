//
//  NoImageView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct NoImageView: View {
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            
            Text(K.Strings.noImageAvailable)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 200)
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    NoImageView()
}
