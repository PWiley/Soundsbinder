//
//  AlbumRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 08.06.22.
//

import Foundation


protocol AlbumRepositoryType {
    func searchAlbum(for url: String, callback: @escaping (Result<[Track], Error>) -> Void)
}

final class AlbumRepository: AlbumRepositoryType {
    
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser = JSONParser()
    private let token = RequestCancellationToken()
    
    init(client: HTTPClientType) {
        self.client = client
    }
  
    func searchAlbum(for url: String, callback: @escaping (Result<[Album], Error>) -> Void) {
        print(url)
        let fileUrl = URL(string: url)
        let request = URLRequest(url: fileUrl!)
        client.send(request: request, token: token) { result in
            switch result {
            case .success(let data):
                let result = self.handle(data: data)
                callback(.success(result))
            case .failure(let error):
                callback(.failure(error))
            }
        }
        }
    
    private func handle(data: Data) -> [Album] {
        guard let result: Result<AlbumResponse, ParserError> = try? self.parser.processCodableResponse(from: data) else {
            return []
        }
        switch result {
        case .success(let response):
            return response.tracks.map { Album(trackNumber: <#T##Int#>, trackTitle: <#T##String#>, albumTitle: <#T##String#>) }
        case .failure(let error):
            assertionFailure(error.localizedDescription)
            print(error)
            return []
        }
    }

  

}
    
    
   

