//
//  ArtistDetailsRepository.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

protocol ArtistDetailsRepositoryType: AnyObject {
    func getFirstAlbum(for artistID: Int, success: @escaping (Album) -> Void, failure: @escaping (() -> Void))
}

final class ArtistDetailsRepository: ArtistDetailsRepositoryType {

    // MARK: - Properties

    private let networkClient: HTTPClient

    private let requestBuilder: SBRequestBuilder

    private let urlRequestBuilder = URLRequestBuilder()

    private let cancellationToken = RequestCancellationToken()

    // MARK: - Init

    init(networkClient: HTTPClient, requestBuilder: SBRequestBuilder) {
        self.networkClient = networkClient
        self.requestBuilder = requestBuilder
    }

    // MARK: - ArtistDetailsRepositoryType

    func getFirstAlbum(for artistID: Int, success: @escaping (Album) -> Void, failure: @escaping (() -> Void)) {
        getFirstArtistAlbum(for: artistID, success: { artistAlbum in
            let albumTracksEndpoint = AlbumTracksEndpoint(albumID: artistAlbum.id)

            guard
                let httpRequest = self.requestBuilder.buildRequest(for: albumTracksEndpoint),
                let urlRequest = try? self.urlRequestBuilder.buildURLRequest(from: httpRequest)
                else { failure() ; return }

            self.networkClient
                .executeTask(urlRequest, cancelledBy: self.cancellationToken)
                .processCodableResponse(callback: { (response: HTTPResponse<AlbumTrackResponse>) in
                    switch response.result {
                    case .success(let albumTrackResponse):
                        success(Album(title: artistAlbum.title, albumTrackResponse: albumTrackResponse))
                    case .failure:
                        failure()
                    }
                })
        }, failure: failure)
    }

    private func getFirstArtistAlbum(for artistID: Int, success: @escaping (ArtistAlbum) -> Void, failure: @escaping (() -> Void)) {
        let artistAlbumsEndoint = ArtistAlbumsEndpoint(artistID: artistID)

        guard
            let httpRequest = self.requestBuilder.buildRequest(for: artistAlbumsEndoint),
            let urlRequest = try? self.urlRequestBuilder.buildURLRequest(from: httpRequest)
            else { failure() ; return }
        
        self.networkClient
            .executeTask(urlRequest, cancelledBy: self.cancellationToken)
            .processCodableResponse { (response: HTTPResponse<ArtistAlbumsResponse>) in
                switch response.result {
                case .success(let albumResponse):
                    if let album = albumResponse.data.first {
                        success(album)
                    }
                case .failure:
                    failure()
                }
        }
    }
}
