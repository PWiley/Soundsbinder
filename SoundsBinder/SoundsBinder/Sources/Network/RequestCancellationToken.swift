//
//  RequestCancellationToken.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 21.12.21.
//


import Foundation

final class RequestCancellationToken {

    init() {}

    var willDeallocate: (() -> Void)?

    deinit {
        willDeallocate?()
    }
}
