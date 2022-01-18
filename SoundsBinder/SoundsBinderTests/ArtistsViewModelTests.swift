//
//  ArtistsViewModelTests.swift
//  SoundsBinderTests
//
//  Created by Patrick Wiley on 12.01.22.
//

import XCTest
@testable import SoundsBinder

final class ArtistsViewModelTests: XCTestCase {

    func testThatWhenViewDidLoadItReturnsData() {
        let repository = MockArtistRepoSitory(response: .success)
        let viewModel = ArtistsViewModel(repository: repository)

        viewModel.artists = { }

        viewModel.viewDidLoad()

        
    }
}

private class MockArtistRepoSitory: ArtistsRepositoryType {

    struct Response {
        let onSearchArtist: Result<ArtistsResponse, Error>
    }

    let response: Response

    init(response: Response) {
        self.response = response
    }

    func searchArtists(for name: String, callback: @escaping InputClosure<Result<ArtistsResponse, Error>>) {
        callback(response.onSearchArtist)
    }
}

private extension MockArtistRepoSitory.Response {
    static var success: MockArtistRepoSitory.Response {
        return .init(onSearchArtist: .success(ArtistsResponse(data: nil))) // TOFIX
    }

    static var failure: MockArtistRepoSitory.Response {
        return .init(onSearchArtist: .failure(HTTPClientError.badRequest))
    }
}
