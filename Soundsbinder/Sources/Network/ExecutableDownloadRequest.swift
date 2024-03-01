//
//  ExecutableDownloadRequest.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

final class ExecutableDownloadRequest {

    private let responsePromise: Promise<URL>

    init(promise: Promise<URL>) {
        self.responsePromise = promise
    }

    func processDownloadResponse(callback: @escaping (HTTPResponse<URL>) -> Void) {
        responsePromise.observe { result in
            switch result {
            case .value(let url, let statusCode):
                callback(HTTPResponse(result: .success(url), originalData: nil, statusCode: statusCode))
            case .error(let error, _, let statusCode):
                callback(HTTPResponse(result: .failure(error), originalData: nil, statusCode: statusCode))
            }
        }
    }
}
