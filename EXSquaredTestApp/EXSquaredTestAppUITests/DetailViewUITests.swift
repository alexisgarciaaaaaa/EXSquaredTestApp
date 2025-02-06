//
//  DetailViewUITests.swift
//  EXSquaredTestAppUITests
//
//  Created by bryangarcia on 6/2/25.
//

import XCTest

final class DetailViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        app.launch()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }
    func navigateToDetailView() {
            let firstCell = app.cells.element(boundBy: 0)
            XCTAssertTrue(firstCell.waitForExistence(timeout: 20), "The first cat item should exist")

            firstCell.tap()

            let detailView = app.staticTexts["detailViewTitle"]
            XCTAssertTrue(detailView.exists, "Detail view should be displayed after tapping a cat")
        }

    func test_navigateToDetailView() {
        navigateToDetailView()
    }

    func test_detailViewDisplaysCorrectInfo() {
        navigateToDetailView()
        
        let description = app.staticTexts["detailViewDescription"]
        XCTAssertTrue(description.exists, "The cat description should be displayed")
    }

    func test_detailViewDisplaysCatInfo() {
        navigateToDetailView()

        let origin = app.staticTexts["Origin"]
        XCTAssertTrue(origin.exists, "Origin should be displayed")

        let lifeSpan = app.staticTexts["Life Span"]
        XCTAssertTrue(lifeSpan.exists, "Life Span should be displayed")

        let temperament = app.staticTexts["Temperament"]
        XCTAssertTrue(temperament.exists, "Temperament should be displayed")
    }

    func test_detailViewDisplaysCatImage() {
        navigateToDetailView()

        let catImage = app.images["catImageView"]
        XCTAssertTrue(catImage.exists, "The cat image should be displayed")
    }
}
