//
//  SBRequestBuilder.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

final class SBRequestBuilder {

    // MARK: - Private properties

    private let url: URL

    // MARK: - Initializer

    init(url: URL = URL(string: "https://api.deezer.com/")!) {
        self.url = url
    }

    // MARK: - Build request

    func buildRequest(for endpoint: Endpoint) -> HTTPRequest? {
        return try? HTTPRequest(baseURL: url,
                                path: endpoint.path,
                                method: endpoint.method,
                                parameters: endpoint.parameters,
                                timeout: endpoint.timeout)
    }
}
