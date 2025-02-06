//
//  ImageCacheManager.swift
//  EXSquaredTestApp
//
//  Created by bryangarcia on 5/2/25.
//

import SwiftUI

class ImageCacheManager {
    static let shared = ImageCacheManager()

    var cache = NSCache<NSString, UIImage>()
    private let session: URLSession  // ✅ Hacemos que use una sesión inyectada

    init(session: URLSession = .shared) {
        self.session = session
    }

    func getImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)

        if let cachedImage = cache.object(forKey: cacheKey) {
            completion(cachedImage)
            return
        }

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let task = session.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                self.cache.setObject(image, forKey: cacheKey)
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}

