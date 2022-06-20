//
//  AlbumRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 08.06.22.
//

import Foundation


protocol AlbumRepositoryType {
    func searchAlbum(for url: URL, callback: @escaping (Result<Album, Error>) -> Void)
}

final class AlbumRepository: AlbumRepositoryType {
    
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser = JSONParser()
    private let token = RequestCancellationToken()
    
    init(client: HTTPClientType) {
        self.client = client
    }
  
    func searchAlbum(for url: URL, callback: @escaping (Result<Album, Error>) -> Void) {
        let request = URLRequest(url: url)
        client.send(request: request, token: token) { response in
            switch response {
            case .success(_): break
                
                //callback(data)
            case .failure: break
                //callback(nil)
            }
        }
    }
}

