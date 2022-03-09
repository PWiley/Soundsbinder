//
//  MockData.swift
//  SoundsBinderTests
//
//  Created by Patrick Wiley on 20.01.22.
//

import Foundation

enum MockData {
    static var artistsList: Data {
        let path = Bundle.test.path(forResource: "ArtistsResponse", ofType: ".json")!
        return try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }

    static var invalidArtistsList: Data {
        let path = Bundle.test.path(forResource: "InvalidArtistsResponse", ofType: ".json")!
        return try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
