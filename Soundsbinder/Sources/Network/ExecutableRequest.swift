//
//  ExecutableRequest.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

final class ExecutableRequest {

    private let responsePromise: Promise<Data>

    init(promise: Promise<Data>) {
        self.responsePromise = promise
    }

    func processCodableResponse<D: Codable>(callback: @escaping (HTTPResponse<D>) -> Void) {
        responsePromise.observe { result in
            switch result {
            case .value(let data, let statusCode):
                do {
                    let object = try JSONDecoder().decode(D.self, from: data)
                    callback(HTTPResponse(result: .success(object), originalData: data, statusCode: statusCode))
                } catch {
                    callback(HTTPResponse(result: .failure(error), originalData: data, statusCode: statusCode))
                }
            case .error(let error, let data, let statusCode):
                callback(HTTPResponse(result: .failure(error), originalData: data, statusCode: statusCode))
            }
        }
    }

    public func processDataResponse(callback: @escaping (HTTPResponse<Data>) -> Void) {
        responsePromise.observe { (result) in
            switch result {
            case .value(let data, let statusCode):
                let object = data
                callback(HTTPResponse(result: .success(object), originalData: data, statusCode: statusCode))
            case .error(let error, let data, let statusCode):
                callback(HTTPResponse(result: .failure(error), originalData: data, statusCode: statusCode))
            }
        }
    }
}
