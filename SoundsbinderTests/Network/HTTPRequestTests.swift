//
//  HTTPRequestTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import XCTest
@testable import Soundsbinder

class HTTPRequestTests: XCTestCase {
    
    func testItSetsDefaultValues() throws {
        let request = try HTTPRequest(baseURL: URL(string: "http://www.deezer.com")!,
                                      path: nil,
                                      method: .GET,
                                      parameters: nil)
        
        XCTAssertNil(request.parameters)
        XCTAssertEqual(10, request.timeout)
    }
    
}

class HTTPMethodTests: XCTestCase {
    
    func testRawValues() {
        XCTAssertEqual("GET", HTTPMethod.GET.rawValue)
        XCTAssertEqual("HEAD", HTTPMethod.HEAD.rawValue)
        XCTAssertEqual("POST", HTTPMethod.POST.rawValue)
        XCTAssertEqual("PUT", HTTPMethod.PUT.rawValue)
        XCTAssertEqual("DELETE", HTTPMethod.DELETE.rawValue)
    }
}
