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
        let testURL = K.Test.testImageURL
        let testImage = UIImage(systemName: "photo")!
        
        imageCacheManager.cache.setObject(testImage, forKey: NSString(string: testURL))
        
        let expectation = XCTestExpectation(description: "Retrieve image from cache")
        
        imageCacheManager.getImage(from: testURL) { cachedImage in
            XCTAssertNotNil(cachedImage, K.Test.cacheRetrieveError)
            XCTAssertEqual(cachedImage?.pngData(), testImage.pngData(), K.Test.cacheImageMismatch)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func test_invalidURLReturnsNil() {
        let invalidURL = K.Test.invalidImageURL
        let expectation = XCTestExpectation(description: K.Test.invalidURLError)
        
        imageCacheManager.getImage(from: invalidURL) { image in
            XCTAssertNil(image, K.Test.invalidURLError)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
}
