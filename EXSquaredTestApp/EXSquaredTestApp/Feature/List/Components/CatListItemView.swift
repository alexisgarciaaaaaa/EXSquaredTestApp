//
//  CatListItemView.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

struct CatListItemView: View {
    let cat: Cat

    var body: some View {
        ZStack {
            ListItemView(cat: cat)
            NavigationLink(destination: DetailView(catId: cat.id)) {
                EmptyView()
            }
            .buttonStyle(PlainButtonStyle())
            .opacity(0)
        }
    }
}
