//
//  AlbumResponse.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 22.06.22.
//

import Foundation

// MARK: - AlbumResponse

struct AlbumResponse: Codable {
    let tracks: [Track]
   
    // MARK: - Datum
    struct Track: Codable {
        
        let title: String
        let duration, rank: Int
        let album: Album
        let type: String

        enum CodingKeys: String, CodingKey {
            case title
            case duration, rank
            case album, type
        }
        // MARK: - Album
        struct Album: Codable {
            
            let title: String
           
            enum CodingKeys: String, CodingKey {
                case title
               
            }
        }
    }
  

}




