//
//  EXSquaredTestAppUITestsLaunchTests.swift
//  EXSquaredTestAppUITests
//
//  Created by bryangarcia on 6/2/25.
//

import XCTest

final class EXSquaredTestAppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
