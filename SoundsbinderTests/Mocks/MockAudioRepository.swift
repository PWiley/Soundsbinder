//
//  MockAudioRepository.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

@testable import Soundsbinder
import Foundation

final class MockAudioRepository: AudioPlayerRepositoryType {

    var url: URL? = nil

    func downloadSound(at url: URL, callback: @escaping (URL?) -> Void) {
        callback(self.url)
    }
}
