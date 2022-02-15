//
//  ImageRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02.02.22.
//

import Foundation

protocol ImageRepositoryType {
    func downloadImage(for url: URL, cancelledBy cancellationToken: RequestCancellationToken, callback: @escaping (Data?) -> Void)
}

final class ImageRepository: ImageRepositoryType {

    // MARK: - Properties

    private let networkClient: HTTPClient
    private let token = RequestCancellationToken()

    init(networkClient: HTTPClient) {
        self.networkClient = networkClient
    }

    // MARK: - ImageRepositoryType

    func downloadImage(for url: URL,
                       cancelledBy cancellationToken: RequestCancellationToken,
                       callback: @escaping (Data?) -> Void) {
        let request = URLRequest(url: url)
        networkClient
            .send(request: request, token: token, completionHandler: { result in
                switch result {
                case .success(let data):
                    callback(data)
                case .failure:
                    callback(nil)
                }
            })
          
        }
    }


