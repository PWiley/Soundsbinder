//
//  ScreensTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class ScreensTests: XCTestCase {

    var context: Context!

    var screens: Screens!

    override func setUp() {
        context = Context(networkClient: mockHTTPClient,
                          requestBuilder: mockContentRequestBuilder,
                          imageProvider: mockImageProvider,
                          audioPlayer: mockAudioPlayer)
        screens = Screens(context: context)
    }

    func testThatCreateArtistSearchViewControllerCorrectly() {
        let viewController = screens.createArtistSearchViewController(delegate: nil)
        XCTAssertNotNil(viewController)
    }

    func testThatCreateArtistDetailsViewControllerCorrectly() {
        let viewController = screens.createArtistDetailsViewController(with: 0, delegate: nil)
        XCTAssertNotNil(viewController)
    }

    func testThatCreateAlertCorrectly() {
        let alertController = screens.createAlert(for: .networkError)
        XCTAssertNotNil(alertController)
    }
}
