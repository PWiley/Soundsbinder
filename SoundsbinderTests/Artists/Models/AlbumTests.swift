//
//  AlbumTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class AlbumTests: XCTestCase {

    func testGivenATrack_WhenInitializedWithAnAlbumTrackResponse_ItsCorrectlyInitialized() {
        let track = Track(position: 1, title: "Europa", previewURLString: "url")
        let response = AlbumTrackResponse(data: [track])
        let album = Album(title: "Santana", albumTrackResponse: response)

        XCTAssertEqual(album.title, "Santana")
        XCTAssertEqual(album.tracks.count, 1)
    }
}
