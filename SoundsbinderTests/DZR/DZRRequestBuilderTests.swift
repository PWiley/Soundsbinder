//
//  DZRRequestBuilderTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

final class DZRRequestBuilderTests: XCTestCase {

    func testThatBuildRequestCorrectly() {
        let url = URL(string: "https://api.deezer.com/")!
        let builder = DZRRequestBuilder(url: url)

        let result = builder.buildRequest(for: MockEndPoint())

        XCTAssertEqual(result?.urlComponents.path, "search")
        XCTAssertEqual(result?.method, .GET)
        XCTAssertNil(result?.parameters)
    }
}

class MockEndPoint: Endpoint {
    let path: String
    let method: HTTPMethod
    let parameters: HTTPRequestParameters?
    
    init() {
        self.path = "search"
        self.method = .GET
        self.parameters = nil
    }
}
