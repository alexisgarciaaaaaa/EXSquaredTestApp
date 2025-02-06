//
//  CatListViewUITests.swift
//  EXSquaredTestAppUITests
//
//  Created by bryangarcia on 6/2/25.
//

import XCTest
@testable import EXSquaredTestApp

final class CatListViewUITests: XCTestCase {
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

    func test_catListViewLoadsSuccessfully() {
        let title = app.staticTexts["Cat Breeds"]
        XCTAssertTrue(title.exists, "The navigation title should be visible")
        
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "The first cat item should load within 5 seconds")
    }

    func test_catListDisplaysMultipleItems() {
        let firstCell = app.cells.element(boundBy: 0)
        let secondCell = app.cells.element(boundBy: 1)

        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "The first cat item should exist")
        XCTAssertTrue(secondCell.exists, "The second cat item should also be displayed")
    }

    func test_scrollFetchesMoreCats() {
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "The first cat item should exist")

        app.swipeUp()
        app.swipeUp()

        let newItem = app.cells.element(boundBy: 3) // Checking for a new item
        XCTAssertTrue(newItem.waitForExistence(timeout: 5), "Newly fetched items should appear after scrolling")
    }

    func test_navigationToCatDetailView() {
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "The first cat item should exist")

        firstCell.tap()
        let detailView = app.staticTexts["detailViewTitle"]
        XCTAssertTrue(detailView.exists, "Detail view should be displayed after tapping a cat")
    }
}

