//
//  EnvManager.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

class EnvManager {
    static let shared = EnvManager()

    private init() {}

    func get(_ key: String, defaultValue: String? = nil) -> String? {
        if let value = Bundle.main.infoDictionary?[key] as? String {
            return value.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        }
        return defaultValue
    }
}

