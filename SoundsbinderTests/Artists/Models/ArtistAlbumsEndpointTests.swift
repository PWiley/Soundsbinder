//
//  ArtistAlbumsEndpointTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class ArtistAlbumsEndpointTests: XCTestCase {

    func testThatCreateCorrectlyArtistAlbumsEndpoint() {
        let endpoint = ArtistAlbumsEndpoint(artistID: 1)
        XCTAssertEqual(endpoint.method, .GET)
        XCTAssertNil(endpoint.parameters)
        XCTAssertEqual(endpoint.path, "artist/1/albums")
    }
}
