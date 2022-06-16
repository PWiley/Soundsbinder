//
//  AlbumRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 08.06.22.
//

import Foundation

struct AlbumResponse: Codable {
    
}

protocol AlbumRepositoryType {
    func downloadAlbum(for url: URL, callback: @escaping (Result<AlbumResponse, Error>) -> Void)
}

final class AlbumRepository: AlbumRepositoryType {
    
    // MARK: - Properties
    
    private let networkClient: HTTPClient
    private let token = RequestCancellationToken()
    
    init(networkClient: HTTPClient) {
        self.networkClient = networkClient
    }
    
    // MARK: - ImageRepositoryType
    
    func downloadAlbum(for url: URL, callback: @escaping (Result<AlbumResponse, Error>) -> Void) {
        let request = URLRequest(url: url)
        networkClient.send(request: request, token: token) { response in
            switch response {
            case .success(let data):
                
                callback(data)
            case .failure:
                callback(nil)
            }
        }
    }
}

