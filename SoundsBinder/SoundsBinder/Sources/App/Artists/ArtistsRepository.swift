//
//  ArtistsRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import Foundation

protocol ArtistsRepositoryType {
    func searchArtists(
        for name: String,
        callback: @escaping InputClosure<Result<[Artist], Error>>
    ) -> Void
}

final class ArtistsRepository: ArtistsRepositoryType {
   
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser: JSONParserType
    private let token = RequestCancellationToken()
    
    
    // MARK: - Initialisers
    
    init(client: HTTPClientType, parser: JSONParserType) {
        self.client = client
        self.parser = parser
    }
    
    func searchArtists(for name: String, callback: @escaping (Result<[Artist], Error>) -> Void) {
        let endpoint = ArtistsEndpoint(name: name)
        guard let request = RequestBuilder().build(from: endpoint) else { return }
        client.send(request: request, token: token, completionHandler: { result in
            switch result {
            case .success(let data):
                let result = self.handle(data: data)
                callback(.success(result))
            case .failure(let error):
                callback(.failure(error))
            }
        })
    }

    private func handle(data: Data) -> [Artist] {
        guard let result: Result<ArtistsResponse, ParserError> = try? self.parser.processCodableResponse(from: data) else {
            return []
        }
        switch result {
        case .success(let response):
            return response.artists.map { Artist(item: $0) }
        case .failure(let error):
            //assertionFailure(error.localizedDescription)
            print(error)
            return []
        }
    }
}

extension Artist {
    init(item: ArtistsResponse.Artist) {
        self.id = item.id
        self.name = item.name
        self.pictureMedium = item.pictureURLString
    }
}
