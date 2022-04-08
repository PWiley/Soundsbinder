//
//  ImageRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02.02.22.
//

import Foundation

final class ImageProvider {

    // MARK: - Properties

    private let networkClient: HTTPClient
    private let token = RequestCancellationToken()
    private let cache = NSCache<NSNumber, NSData>()

    init() {
        networkClient = HTTPClient()
    }

    // MARK: - Methods
    
    
    func setImage(with url: URL,
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

