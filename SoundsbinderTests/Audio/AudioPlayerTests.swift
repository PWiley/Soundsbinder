//
//  AudioPlayerTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
import AVKit
@testable import Soundsbinder

final class AudioPlayerTests: XCTestCase {

    let repository = MockAudioRepository()
    let fileManager = MockFileManager()

    func testGivenAnAudioPlayer_WhenStartPlayingWithAlreadyExistingSound_ItPlaysDirectly() {
        let bundle = Bundle(for: AudioPlayerTests.self)
        let url = bundle.url(forResource: "daft_punk_preview", withExtension: "mp3")!

        fileManager.urls = [url.deletingLastPathComponent()]

        let player = AudioPlayer(repository: repository, fileManager: fileManager)
        player.startPlayingTrack(at: url)

        XCTAssertTrue(player.isPlaying)
    }

    func testGivenAnAudioPlayer_WhenStartPlayingWithANewSound_ItDownloadIt_AndStartPlayingCorrectly() {
        let bundle = Bundle(for: AudioPlayerTests.self)
        let url = bundle.url(forResource: "daft_punk_preview", withExtension: "mp3")!
        
        fileManager.urls = [URL(string: "Factis")!]
        repository.url = url

        let player = AudioPlayer(repository: repository, fileManager: fileManager)
        player.startPlayingTrack(at: url)
    
        XCTAssertTrue(player.isPlaying)
    }

    func testGivenAnAudioPlayer_WhenStopAPlayingSound_ItStopCorrectly() {
        let bundle = Bundle(for: AudioPlayerTests.self)
        let url = bundle.url(forResource: "daft_punk_preview", withExtension: "mp3")!

        fileManager.urls = [url.deletingLastPathComponent()]

        let player = AudioPlayer(repository: repository, fileManager: fileManager)
        player.startPlayingTrack(at: url)
        player.stop()

        XCTAssertFalse(player.isPlaying)
    }

    func testGivenAnAudioPlayer_WhenDidFinishPlayingSound_DelegateIsCorrectlySent() {
        let bundle = Bundle(for: AudioPlayerTests.self)
        let url = bundle.url(forResource: "daft_punk_preview", withExtension: "mp3")!
        fileManager.urls = [url.deletingLastPathComponent()]
        let expectation = self.expectation(description: "Wait for the end of Daft punk sound 🕺🏻")

        let player = AudioPlayer(repository: repository, fileManager: fileManager)
        let mockDelegate = MockAudioPlayerDelegate()
        player.delegate = mockDelegate

        player.startPlayingTrack(at: url)

        DispatchQueue.main.asyncAfter(deadline: .now() + 35) { // just enough time to listen an awesome song 🖖
            XCTAssertTrue(mockDelegate.didFinishPlayingSound)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 36, handler: nil)
    }
}

final class MockAudioPlayerDelegate: AudioPlayerDelegate {

    var didFinishPlayingSound = false

    func playerDidFinishPlayingSound() {
        didFinishPlayingSound = true
    }
}
