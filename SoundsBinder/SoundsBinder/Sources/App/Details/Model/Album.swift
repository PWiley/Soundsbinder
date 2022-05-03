//
//  Album.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.05.22.
//

import Foundation

struct Track {
    var trackNumber: Int
    var trackTitle: String
    var albumTitle: String
}

struct Album {
    var tracks: [Track]
    
}

