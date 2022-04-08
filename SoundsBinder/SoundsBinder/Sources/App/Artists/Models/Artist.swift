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
    let pictureMedium: String?
    var imageData: Data?

}

struct VisibleArtist: Equatable {
    let name: String
    let pictureURLString: String?
    var imageData: Data? = nil
}

extension VisibleArtist {
    init(artist: Artist) {
        self.name = artist.name
        self.pictureURLString = artist.pictureMedium
        self.imageData = artist.imageData
    }
}

