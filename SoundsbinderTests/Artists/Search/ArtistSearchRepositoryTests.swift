//
//  ArtistSearchRepositoryTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class ArtistSearchRepositoryTests: XCTestCase {

    func testThatGetArtistsEndpointWorks() {
        let repository = ArtistSearchRepository(networkClient: mockHTTPClient,
                                                requestBuilder: mockContentRequestBuilder)
        let expectation = self.expectation(description: "Waiting for response")

        repository.getArtists(for: "Toto", success: { _ in
            expectation.fulfill()
        }, failure: {
            XCTFail()
        })

        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
