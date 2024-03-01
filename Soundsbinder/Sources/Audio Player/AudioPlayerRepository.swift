//
//  AudioPlayerRepository.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

protocol AudioPlayerRepositoryType: AnyObject {
    func downloadSound(at url: URL, callback: @escaping (URL?) -> Void)
}

final class AudioPlayerRepository: AudioPlayerRepositoryType {

    // MARK: - Properties

    private let networkClient: HTTPClient

    private let cancellationToken = RequestCancellationToken()

    // MARK: - Init

    init(networkClient: HTTPClient) {
        self.networkClient = networkClient
    }

    // MARK: - AudioPlayerRepositoryType

    func downloadSound(at url: URL, callback: @escaping (URL?) -> Void) {
        let request = URLRequest(url: url)
        networkClient
            .downloadTask(request, cancelledBy: cancellationToken)
            .processDownloadResponse { (response) in
                switch response.result {
                case .success(let location):
                    callback(location)
                case .failure:
                    callback(nil)
                }
        }
    }
}
