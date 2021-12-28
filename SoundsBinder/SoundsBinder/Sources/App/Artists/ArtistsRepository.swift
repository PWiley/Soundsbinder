//
//  ArtistsRepository.swift
//  Deezer
//
//  Created by Patrick Wiley on 02/12/2021.
//

import Foundation

enum ArtistsRepositoryError: Error {
    
}

protocol ArtistsRepositoryType {
    func searchArtists(
        for name: String,
        callback: InputClosure<Result<ArtistsResponse, ArtistsRepositoryError>>
    )
}
