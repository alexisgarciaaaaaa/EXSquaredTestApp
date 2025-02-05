//
//  CatInfoView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct CatInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title + ":")
                .bold()
            Spacer()
            Text(value)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    CatInfoView(title: "", value: "")
}
