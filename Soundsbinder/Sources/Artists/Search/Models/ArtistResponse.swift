//
//  ArtistResponse.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

struct ArtistResponse: Codable {
    let artists: [Artist]

    enum CodingKeys: String, CodingKey {
        case artists = "data"
    }
}
