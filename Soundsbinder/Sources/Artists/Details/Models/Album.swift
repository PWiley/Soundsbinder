//
//  Album.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

struct Album: Codable {
    let title: String
    let tracks: [Track]
}

extension Album {
    init(title: String, albumTrackResponse: AlbumTrackResponse) {
        self.title = title
        self.tracks = albumTrackResponse.data
    }
}
