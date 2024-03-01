//
//  AlbumEndpoint.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

struct AlbumTracksEndpoint: Endpoint {
    let path: String
    let method: HTTPMethod
    let parameters: HTTPRequestParameters?
    
    init(albumID: Int) {
        self.path = "album/\(albumID)/tracks"
        self.method = .GET
        self.parameters = nil
    }
}
