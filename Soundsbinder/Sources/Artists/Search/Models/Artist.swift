//
//  Artist.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

struct Artist: Codable {
    let id: Int
    let name: String
    let pictureURLString: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pictureURLString = "picture_medium"
    }
}
