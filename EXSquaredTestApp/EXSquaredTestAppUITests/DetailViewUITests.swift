//
//  DetailViewUITests.swift
//  EXSquaredTestAppUITests
//
//  Created by bryangarcia on 6/2/25.
//

import XCTest
@testable import EXSquaredTestApp

final class DetailViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append(K.Test.testingArgument)
        app.launch()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }

    func navigateToDetailView() {
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 20), K.Test.firstItemNotFound)

        firstCell.tap()

        let detailView = app.staticTexts[K.Test.detailViewTitle]
        XCTAssertTrue(detailView.exists, K.Test.detailViewNotDisplayed)
    }

    func test_navigateToDetailView() {
        navigateToDetailView()
    }

    func test_detailViewDisplaysCorrectInfo() {
        navigateToDetailView()
        
        let description = app.staticTexts[K.Test.detailViewDescription]
        XCTAssertTrue(description.exists, K.Test.descriptionNotFound)
    }

    func test_detailViewDisplaysCatInfo() {
        navigateToDetailView()

        let origin = app.staticTexts[K.Test.detailViewOrigin]
        XCTAssertTrue(origin.exists, K.Test.originNotFound)

        let lifeSpan = app.staticTexts[K.Test.detailViewLifeSpan]
        XCTAssertTrue(lifeSpan.exists, K.Test.lifeSpanNotFound)

        let temperament = app.staticTexts[K.Test.detailViewTemperament]
        XCTAssertTrue(temperament.exists, K.Test.temperamentNotFound)
    }

    func test_detailViewDisplaysCatImage() {
        navigateToDetailView()

        let catImage = app.images[K.Test.catImageView]
        XCTAssertTrue(catImage.exists, K.Test.catImageNotFound)
    }
}
