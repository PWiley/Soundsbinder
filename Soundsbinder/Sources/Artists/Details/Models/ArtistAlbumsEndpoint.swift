//
//  ArtistAlbumsEndpoint.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

struct ArtistAlbumsEndpoint: Endpoint {
    let path: String
    let method: HTTPMethod
    let parameters: HTTPRequestParameters?
    
    init(artistID: Int) {
        self.path = "artist/\(artistID)/albums"
        self.method = .GET
        self.parameters = nil
    }
}
