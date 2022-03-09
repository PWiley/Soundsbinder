//
//  ArtistsViewModelTests.swift
//  SoundsBinderTests
//

import Foundation
import XCTest
@testable import SoundsBinder

final class ArtistsViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    private var repository: ArtistsRepositoryType!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        
    }

    // MARK: - Tests
    
    func testGivenArtistsViewModel_WhenViewDidLoad_ThenItReturnsNoArtists() {
        let expectation = self.expectation(description: "No Returned Artists")
        let repository = MockArtistRepoSitory(responses: .success)
        let viewModel = ArtistsViewModel(repository: repository)
        
        viewModel.items = { items in
            XCTAssertTrue(items.isEmpty)
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()

        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenArtistsViewModel_WhenViewWillAppear_WithSuccess_ThenItReturnsArtists() {
        let expectation = self.expectation(description: "Returned Artists")
        let repository = MockArtistRepoSitory(responses: .success)
        let viewModel = ArtistsViewModel(repository: repository)
        
        viewModel.items = { items in
            XCTAssertEqual(25, items.count)
            expectation.fulfill()
        }

        viewModel.didPressSearch(for: "Gainsbourg")

        self.waitForExpectations(timeout: 2.0, handler: nil)
    }
}

private class MockArtistRepoSitory: ArtistsRepositoryType {
    
    let responses: Responses
    
    init(responses: Responses) {
        self.responses = responses
    }
    
    struct Responses {
        var onSearchArtist: Result<[Artist], Error>
    }

    func searchArtists(
        for name: String,
        callback: @escaping InputClosure<Result<[Artist], Error>>) {
        callback(responses.onSearchArtist)
    }
}

extension MockArtistRepoSitory.Responses {
    fileprivate static var success: MockArtistRepoSitory.Responses {
        .init(onSearchArtist: .success(mockArtists))
    }
    fileprivate static var failure: MockArtistRepoSitory.Responses {
        .init(onSearchArtist: .failure(MockError.error))
    }
    private static let mockArtists = try! JSONDecoder().decode(ArtistsResponse.Artists.self, from: MockData.artistsList).artists.map { Artist(item: $0.artist) }
    private enum MockError: Error {
        case error
    }
}
