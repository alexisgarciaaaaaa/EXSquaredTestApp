//
//  Cat+Equable.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

extension Cat: Equatable {
    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id
    }
}
