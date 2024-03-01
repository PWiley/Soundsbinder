//
//  HTTPEngine.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

public typealias HTTPCompletionHandler = (Data?, HTTPURLResponse?, Error?) -> Void
public typealias DownloadCompletionHandler = (URL?, HTTPURLResponse?, Error?) -> Void

public protocol HTTPEngine {
    func send(request: URLRequest, cancelledBy token: RequestCancellationToken, completion: @escaping HTTPCompletionHandler)
    func download(request: URLRequest, cancelledBy token: RequestCancellationToken, completionHandler: @escaping DownloadCompletionHandler)
}
