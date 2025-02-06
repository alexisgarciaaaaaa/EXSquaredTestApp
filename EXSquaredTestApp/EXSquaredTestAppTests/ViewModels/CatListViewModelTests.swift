//
//  CatListViewModelTests.swift
//  EXSquaredTestAppTests
//
//  Created by bryangarcia on 5/2/25.
//

import XCTest
import Combine
@testable import EXSquaredTestApp

final class CatListViewModelTests: XCTestCase {
    
    var viewModel: CatListViewModel!
    var mockUseCase: MockCatListService!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockCatListService()
        viewModel = CatListViewModel(useCase: mockUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    // ✅ 1️⃣ Estado inicial del ViewModel
    func test_initialState() {
        XCTAssertEqual(viewModel.cats.count, 0)
        XCTAssertEqual(viewModel.loadingState, .idle)
        XCTAssertFalse(viewModel.isFetchingMore)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    // ✅ 2️⃣ Prueba que `fetchCats` carga correctamente los datos
    func test_fetchCats_success() {
        mockUseCase.initialResponse = [
            Cat(
                id: "1",
                name: "Siamese",
                description: "Smart and active",
                temperament: "Curious, Playful",
                lifeSpan: "12-15",
                energyLevel: 4,
                adaptability: 5,
                image: CatImage(url: "https://example.com/siamese.jpg")
            )
        ]
        
        let expectation = XCTestExpectation(description: "fetchCats should update cats list")
        
        viewModel.$cats
            .dropFirst()
            .sink { cats in
                XCTAssertEqual(cats.count, 1)
                XCTAssertEqual(cats.first?.name, "Siamese")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchCats()
        
        wait(for: [expectation], timeout: 2)
    }
    
    // ✅ 3️⃣ Prueba que `fetchCats` maneja errores correctamente
    func test_fetchCats_failure() {
        mockUseCase.shouldReturnError = true
        
        let expectation = XCTestExpectation(description: "fetchCats should set errorMessage")

        viewModel.$loadingState
            .dropFirst()
            .sink { state in
                if case .error(let message) = state {
                    XCTAssertNotNil(message)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.fetchCats()

        wait(for: [expectation], timeout: 2)
    }
    
    // ✅ 4️⃣ Prueba que `fetchMoreCats` agrega nuevos gatos a la lista
    func test_fetchMoreCats_success() {
        // Primera respuesta de la API
        mockUseCase.initialResponse = [
            Cat(
                id: "1",
                name: "Siamese",
                description: "Smart and active",
                temperament: "Curious, Playful",
                lifeSpan: "12-15",
                energyLevel: 4,
                adaptability: 5,
                image: CatImage(url: "https://example.com/siamese.jpg")
            )
        ]

        // Segunda respuesta (nuevos datos)
        mockUseCase.moreCatsResponse = [
            Cat(
                id: "2",
                name: "Maine Coon",
                description: "Large and fluffy",
                temperament: "Gentle, Sociable",
                lifeSpan: "13-16",
                energyLevel: 3,
                adaptability: 4,
                image: CatImage(url: "https://example.com/mainecoon.jpg")
            )
        ]

        viewModel.fetchCats()

        let expectation = XCTestExpectation(description: "fetchMoreCats should append data")

        viewModel.$cats
            .dropFirst()
            .sink { cats in
                if cats.count == 2 {
                    XCTAssertEqual(cats.last?.name, "Maine Coon")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.fetchMoreCats()

        wait(for: [expectation], timeout: 2)
    }

    
    // ✅ 5️⃣ Prueba que `fetchMoreCats` maneja el error correctamente
    func test_fetchMoreCats_failure() {
        viewModel.fetchCats()
        mockUseCase.shouldReturnError = true

        let expectation = XCTestExpectation(description: "fetchMoreCats should set errorMessage")

        viewModel.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertNotNil(errorMessage)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchMoreCats()

        wait(for: [expectation], timeout: 2)
    }
}
