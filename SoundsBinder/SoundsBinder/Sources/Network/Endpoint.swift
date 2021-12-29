//
//  Endpoint.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 21.12.21.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var queryParameters: [String: Any]? { get }
}
