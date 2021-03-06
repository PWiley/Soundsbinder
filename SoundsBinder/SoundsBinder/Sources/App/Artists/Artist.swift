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
    //let imageData: Data?
    let pictureMedium: String?

}

struct VisibleArtist: Equatable {
    let name: String
    //let imageData: Data?
    let pictureURLString: String?
}

extension VisibleArtist {
    init(artist: Artist) {
        self.name = artist.name
        //self.imageData = artist.imageData
        self.pictureURLString = artist.pictureMedium
    }
}

