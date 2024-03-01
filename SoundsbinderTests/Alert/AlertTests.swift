//
//  AlertTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class AlertTests: XCTestCase {

    func test() {
        let alert = Alert(type: .networkError)
        XCTAssertEqual(alert.title, "Alert")
        XCTAssertEqual(alert.message, "A very very bad thing happened.. 🙈")
    }
}
