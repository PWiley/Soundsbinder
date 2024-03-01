//
//  ArtistSearchEndpoint.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
//

import Foundation

struct ArtistSearchEndpoint: Endpoint {
    let path: String
    let method: HTTPMethod
    let parameters: HTTPRequestParameters?
    
    init(name: String) {
        self.path = "search/artist?q=\(name)"
        self.method = .GET
        self.parameters = nil
    }
}
