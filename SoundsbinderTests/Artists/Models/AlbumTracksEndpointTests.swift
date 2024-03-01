//
//  AlbumTracksEndpointTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class AlbumTracksEndpointTests: XCTestCase {

    func testThatCreateCorrectlyAlbumTracksEndpoint() {
        let endpoint = AlbumTracksEndpoint(albumID: 1)
        XCTAssertEqual(endpoint.method, .GET)
        XCTAssertNil(endpoint.parameters)
        XCTAssertEqual(endpoint.path, "album/1/tracks")
    }
}
