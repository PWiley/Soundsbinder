//
//  URLRequestBuilder.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

final class URLRequestBuilder {

    // MARK: - Private properties

    private let jsonInBodyEncoder = JSONBodyEncoder()

    // MARK: - Internal

    func buildURLRequest(from request: HTTPRequest) throws -> URLRequest {
        var urlRequest = URLRequest(url: request.url)

        setTimeout(from: request, in: &urlRequest)
        setMethod(from: request, in: &urlRequest)
        if let parameters = request.parameters {
            try jsonInBodyEncoder.encode(request: &urlRequest, parameters: parameters)
        }

        return urlRequest
    }

    private func setMethod(from request: HTTPRequest, in urlRequest: inout URLRequest) {
        urlRequest.httpMethod = request.method.rawValue
    }

    private func setTimeout(from request: HTTPRequest, in urlRequest: inout URLRequest) {
        urlRequest.timeoutInterval = request.timeout
    }
}
