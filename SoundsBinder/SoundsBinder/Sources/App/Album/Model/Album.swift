//
//  Track.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.05.22.
//

import Foundation

struct Track: Codable {
    
    let title: String
    let duration: Int
    let album: Album

    enum CodingKeys: String, CodingKey {
        case title
        case duration
        case album
    }
    // MARK: - Album
    struct Album: Codable {
        
        let title: String
       
        enum CodingKeys: String, CodingKey {
            case title
            
        }}}
