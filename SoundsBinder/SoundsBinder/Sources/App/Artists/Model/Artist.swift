//
//  Artist.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 26.01.22.
//

import Foundation

struct Artist {
    let id: Int
    let name: String
    let pictureMedium: String
    let tracklist: String
}

struct VisibleArtist: Equatable {
    let id: Int
    let name: String
    let pictureURLString: String
    let tracklist: String
}

extension VisibleArtist {
    init(artist: Artist) {
        self.id = artist.id
        self.name = artist.name
        self.pictureURLString = artist.pictureMedium
        self.tracklist = artist.tracklist
    }
}

