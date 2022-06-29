//
//  Track.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.05.22.
//

import Foundation

struct Track: Codable {
    let title: String
    let duration: Int
}

struct VisibleTrack: Equatable {
    let title: String
    let duration: Int
}

extension VisibleTrack {
    init(track: Track) {
        self.title = track.title
        self.duration = track.duration
        
    }
}
