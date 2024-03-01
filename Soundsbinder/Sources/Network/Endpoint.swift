//
//  Endpoint.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: HTTPRequestParameters? { get }
    var timeout: TimeInterval { get }
}

extension Endpoint {
    public var timeout: TimeInterval {
        return 30
    }
}
