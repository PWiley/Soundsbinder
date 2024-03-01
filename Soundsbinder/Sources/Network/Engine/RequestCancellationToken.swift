//
//  RequestCancellationToken.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

/// Object defining lifecycle of a pending HTTP request.
/// The request associated with this instance will be cancelled when the instance gets deallocated.
public class RequestCancellationToken {

    // MARK: - Lifecycle

    public init() {}

    deinit {
        willDeallocate?()
    }

    // MARK: - Internal

    internal var willDeallocate: (() -> Void)?
}
