//
//  StatView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct StatView: View {
    let title: String
    let value: Int
    
    var body: some View {
        HStack {
            Text(title)
                .bold()
            Spacer()
            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < value ? "star.fill" : "star")
                        .foregroundColor(index < value ? .yellow : .gray)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    StatView(title: "", value: 0)
}
