//
//  Track.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

struct Track: Codable {
    let position: Int
    let title: String
    let previewURLString: String
    
    enum CodingKeys: String, CodingKey {
        case position = "track_position"
        case title
        case previewURLString = "preview"
    }
}
