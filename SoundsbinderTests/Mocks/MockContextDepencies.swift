//
//  MockContextDepencies.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

@testable import Soundsbinder
import Foundation

var mockHTTPClient: HTTPClient {
    return HTTPClient(engine: .urlSession(.default))
}

var mockContentRequestBuilder: SBRequestBuilder {
    return SBRequestBuilder(url: URL(string: "https://api.deezer.com/")!)
}

var mockAudioPlayer: AudioPlayer {
    return AudioPlayer(repository: MockAudioRepository(),
                       fileManager: MockFileManager())
}

var mockImageProvider: ImageProvider {
    return ImageProvider(repository: MockImageRepository(),
                         cache: NSCache<Key, Object>())
}


