//
//  URLSessionEngine.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

enum URLSessionEngineError: Error {
    case invalidURLResponseType
}

final class URLSessionEngine: HTTPEngine {

    // MARK: - Properties

    private let session: URLSession

    // MARK: - Init

    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }

    // MARK: - Internal

    func send(request: URLRequest, cancelledBy token: RequestCancellationToken, completion: @escaping HTTPCompletionHandler) {
        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            if urlResponse != nil {
                guard let httpUrlResponse = urlResponse as? HTTPURLResponse else {
                    completion(data, nil, URLSessionEngineError.invalidURLResponseType)
                    return
                }
                completion(data, httpUrlResponse, error)
            } else {
                completion(data, nil, error)
            }
        }

        task.resume()
        token.willDeallocate = { task.cancel() }
    }

    func download(request: URLRequest, cancelledBy token: RequestCancellationToken, completionHandler: @escaping DownloadCompletionHandler) {
        let task = session.downloadTask(with: request) { (url, urlResponse, error) in
            if urlResponse != nil {
                guard let httpUrlResponse = urlResponse as? HTTPURLResponse else {
                    completionHandler(url, nil, URLSessionEngineError.invalidURLResponseType)
                    return
                }
                completionHandler(url, httpUrlResponse, error)
            } else {
                completionHandler(url, nil, error)
            }
        }

        task.resume()
        token.willDeallocate = { task.cancel() }
    }

    // MARK: - Deinit

    deinit {
        session.invalidateAndCancel()
    }
}
