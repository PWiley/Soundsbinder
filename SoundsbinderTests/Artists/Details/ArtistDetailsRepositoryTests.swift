//
//  ArtistDetailsRepositoryTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class ArtistDetailsRepositoryTests: XCTestCase {

    func testThatGetFirstAlbumEndpointWorks() {
        let repository = ArtistDetailsRepository(networkClient: mockHTTPClient,
                                                 requestBuilder: mockContentRequestBuilder)
        let expectation = self.expectation(description: "Waiting for response")

        repository.getFirstAlbum(for: 103248, success: { _ in
            expectation.fulfill()
        }, failure: {
            XCTFail()
        })

        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
