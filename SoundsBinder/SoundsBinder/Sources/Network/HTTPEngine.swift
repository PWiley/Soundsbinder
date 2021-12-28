//
//  HTTPEngine.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 21.12.21.
//


import Foundation

//typealias HTTPCompletionHandler = (Data?, HTTPURLResponse?, Error?) -> Void

enum URLSessionEngineError: Error {
    case invalideURLResponse
}

protocol HTTPEngineType: AnyObject {
    func send(request: URLRequest,
              cancelledBy token: RequestCancellationToken,
              callback: @escaping HTTPCompletionHandler)
}

protocol URLSessionType {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
    func invalidateAndCancel()
    init(configuration: URLSessionConfiguration)
}

extension URLSession: URLSessionType {}

final class HTTPEngine: HTTPEngineType {

    private let session: URLSessionType

    init(session: URLSessionType) {
        self.session = session
    }

    func send(request: URLRequest,
              cancelledBy token: RequestCancellationToken,
              callback: @escaping HTTPCompletionHandler) {
        let task  = session.dataTask(with: request) { (data, urlResponse, _) in
            if urlResponse != nil, let httpURLResponse = urlResponse as? HTTPURLResponse {
                callback(data, httpURLResponse, nil)
            } else {
                callback(data, nil, URLSessionEngineError.invalideURLResponse)
            }
        }
        task.resume()
        token.willDeallocate = {
            task.cancel()
        }
    }

    deinit {
        session.invalidateAndCancel()
    }
}
