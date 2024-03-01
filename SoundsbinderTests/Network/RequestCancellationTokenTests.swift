//
//  RequestCancellationTokenTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class RequestCancellationTokenTests: XCTestCase {

    func testItExecutesBlockWhenDeallocating() {
        let expectation = self.expectation(description: "`willDeallocate` block was executed")

        autoreleasepool {
            let token = RequestCancellationToken()
            token.willDeallocate = { expectation.fulfill() }
        }

        waitForExpectations(timeout: 1, handler: nil)
    }
}
