//
//  MockImageRepository.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import UIKit
@testable import Soundsbinder

final class MockImageRepository: ImageRepositoryType {

    var data: Data? = nil

    func downloadImage(for url: URL,
                       cancelledBy cancellationToken: RequestCancellationToken,
                       callback: @escaping (Data?) -> Void) {
        callback(data)
    }
}
