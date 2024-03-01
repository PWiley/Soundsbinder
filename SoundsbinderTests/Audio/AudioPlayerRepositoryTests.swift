//
//  AudioPlayerRepositoryTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class AudioPlayerRepositoryTests: XCTestCase {

    func testGivenAnAudioPlayerRepository_WhenSendDownloadSound_callbackIsCalled() {
        let repository = AudioPlayerRepository(networkClient: mockHTTPClient)
        let expectation = self.expectation(description: "callback block was executed")

        repository.downloadSound(at: URL(string: "https://cdns-preview-d.dzcdn.net/stream/c-deda7fa9316d9e9e880d2c6207e92260-5.mp3")!, callback: { _ in
            expectation.fulfill()
        })

        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
