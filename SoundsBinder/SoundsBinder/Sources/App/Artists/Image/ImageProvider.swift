//
//  ImageRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02.02.22.
//

import Foundation
import UIKit

final class ImageProvider {

    // MARK: - Properties

    private let repository: ImageRepositoryType
    private let cache = NSCache<NSNumber, NSData>()
    
    fileprivate enum CachedImage {
        case exists(data: NSData)
        case new
    }

    init(repository: ImageRepositoryType, cache: NSCache<NSNumber, NSData>) {
        self.repository = repository
        self.cache = cache
    }
    // MARK: - Methods
    
    
    func setImage(with url: URL,
                  cancellationToken: RequestCancellationToken,
                  callback: @escaping (UIImage?) -> Void) {
        let nsNumber = url.hashValue.description
        let cachedImage = CachedImage(with: nsNumber(string: nsNumber), in: cache)
        repository.downloadImage(for: url, cancelledBy: cancellationToken, callback: <#T##(Data?) -> Void#>)
        }
    }

extension ImageProvider.CachedImage {
    init(with uid: NSNumber, in cache: NSCache<NSNumber, NSData>) {
        if let data = cache.object(forKey: uid) {
            self = .exists(data: data)
        } else {
            self = .new
        }
    }
}
