//
//  ArtistsEndpoint.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 10.01.22.
//

import Foundation

final class ArtistsEndpoint: Endpoint {
    
    var method: HTTPMethod
    var path: String
    var queryParameters: [String : Any]?
    
    init(name: String) {
        self.method = .GET
        self.path = "https://api.deezer.com/search"
        self.queryParameters = ["q": "artist:\(name)"]
    }
}
