//
//  CatDetailViewModelTests.swift
//  EXSquaredTestAppTests
//
//  Created by bryangarcia on 5/2/25.
//

import XCTest
import Combine
@testable import EXSquaredTestApp

final class CatDetailViewModelTests: XCTestCase {

    var viewModel: CatDetailViewModel!
    var mockUseCase: MockCatListService!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockUseCase = MockCatListService()
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        cancellables.removeAll()
        super.tearDown()
    }

    func test_initialization_triggersFetchCatDetails() {
        mockUseCase.mockDetailResponse = CatDetail.mock(name: "Siamese")

        let expectation = XCTestExpectation(description: "fetchCatDetails should be triggered on init")

        viewModel = CatDetailViewModel(useCase: mockUseCase, catID: "1")

        viewModel.$cat
            .dropFirst()
            .sink { cat in
                XCTAssertEqual(cat?.name, "Siamese")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 2)
    }

    func test_fetchCatDetails_success() {
        mockUseCase.mockDetailResponse = CatDetail.mock()

        let expectation = XCTestExpectation(description: "fetchCatDetails should update the cat property")

        viewModel = CatDetailViewModel(useCase: mockUseCase, catID: "2")

        viewModel.$cat
            .dropFirst()
            .sink { cat in
                XCTAssertEqual(cat?.name, "Maine Coon")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 2)
    }
}
