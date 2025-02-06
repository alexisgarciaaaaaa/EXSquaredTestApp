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
        app.launchArguments.append(K.Test.testingArgument)
        app.launch()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }

    func test_catListViewLoadsSuccessfully() {
        let title = app.staticTexts[K.Test.catListTitle]
        XCTAssertTrue(title.exists, K.Test.navigationVisibleTitle)
        
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5),K.Test.firstCatItemError)
    }

    func test_catListDisplaysMultipleItems() {
        let firstCell = app.cells.element(boundBy: 0)
        let secondCell = app.cells.element(boundBy: 1)

        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), K.Test.multipleItemsError)
        XCTAssertTrue(secondCell.exists, K.Test.secondItemError)
    }

    func test_scrollFetchesMoreCats() {
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), K.Test.multipleItemsError)

        app.swipeUp()
        app.swipeUp()

        let newItem = app.cells.element(boundBy: 3) // Checking for a new item
        XCTAssertTrue(newItem.waitForExistence(timeout: 5), K.Test.newItemError)
    }

    func test_navigationToCatDetailView() {
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), K.Test.multipleItemsError)

        firstCell.tap()
        let detailView = app.staticTexts[K.Test.detailViewTitle]
        XCTAssertTrue(detailView.exists, K.Test.detailViewError)
    }
}

