//
//  ArtistsResponse.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 28.12.21.
//

import Foundation

// MARK: - ArtistsResponse

struct ArtistsResponse: Codable {
    let artists: [Artist]

    enum CodingKeys: String, CodingKey {
        case artists = "data"
    }

    struct Artist: Codable {
        let id: Int
        let name: String
        let pictureURLString: String
        let tracklist: String

        enum CodingKeys: String, CodingKey {
            case id
            case name
            case pictureURLString = "picture_medium"
            case tracklist
        }
    }
}
