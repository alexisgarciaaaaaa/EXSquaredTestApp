//
//  ImageCacheManagerTests.swift
//  EXSquaredTestAppTests
//
//  Created by bryangarcia on 5/2/25.
//

import XCTest
@testable import EXSquaredTestApp

final class ImageCacheManagerTests: XCTestCase {
    
    var imageCacheManager: ImageCacheManager!

    override func setUp() {
        super.setUp()
        imageCacheManager = ImageCacheManager.shared
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_cacheStoresAndRetrievesImage() {
        let testURL = "https://example.com/test-image.jpg"
        let testImage = UIImage(systemName: "photo")!

        imageCacheManager.cache.setObject(testImage, forKey: NSString(string: testURL))

        imageCacheManager.getImage(from: testURL) { cachedImage in
            XCTAssertNotNil(cachedImage, "The image should be retrieved from the cache")
            XCTAssertEqual(cachedImage, testImage, "The retrieved image should be the same as the stored one")
        }
    }

    func test_invalidURLReturnsNil() {
        let invalidURL = "invalid-url"

        let expectation = XCTestExpectation(description:  "Should return nil for an invalid URL")

        imageCacheManager.getImage(from: invalidURL) { image in
            XCTAssertNil(image, "Should return nil for an invalid URL")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2)
    }
}
