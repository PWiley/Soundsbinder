//
//  RequestCancellationToken.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 21.12.21.
//

import Foundation

final class RequestCancellationToken {

    // MARK: - Init

    init() {}

    // MARK: - Deinit

    deinit {
        willDeallocate?()
    }

    // MARK: - Properties

    var willDeallocate: (() -> Void)?
}

