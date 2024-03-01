//
//  Context.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
//

import Foundation

final class Context {

    // MARK: - Public properties

    let networkClient: HTTPClient

    let requestBuilder: DZRRequestBuilder

    let imageProvider: ImageProvider

    let audioPlayer: AudioPlayer

    // MARK: - Initializer

    init(networkClient: HTTPClient, requestBuilder: DZRRequestBuilder, imageProvider: ImageProvider, audioPlayer: AudioPlayer) {
        self.networkClient = networkClient
        self.requestBuilder = requestBuilder
        self.imageProvider = imageProvider
        self.audioPlayer = audioPlayer
    }
}
