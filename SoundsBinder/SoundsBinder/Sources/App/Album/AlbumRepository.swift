//
//  AlbumRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 08.06.22.
//

import Foundation


protocol AlbumRepositoryType {
    func searchAlbum(for url: URL, callback: @escaping (Result<[Track], Error>) -> Void)
}

final class AlbumRepository: AlbumRepositoryType {
    
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser = JSONParser()
    private let token = RequestCancellationToken()
    
    init(client: HTTPClientType) {
        self.client = client
    }
  
    func searchAlbum(for url: URL, callback: @escaping (Result<[Track], Error>) -> Void) {
       
        let request = URLRequest(url: url)
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
    
    private func handle(data: Data) -> [Track] {
        guard let result: Result<AlbumResponse, ParserError> = try? self.parser.processCodableResponse(from: data) else {
            return []
        }
        switch result {
        case .success(let response):
            return response.tracks.map { Track(item: $0) }
        case .failure(let error):
            assertionFailure(error.localizedDescription)
            print(error)
            return []
        }
    }

  

}
             extension Track {
                 init(item: AlbumResponse.Track) {
                     self.title = item.title
                     self.duration = item.duration
                 }
             }
    
   

