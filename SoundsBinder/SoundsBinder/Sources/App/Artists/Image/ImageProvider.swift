//
//  ImageRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02.02.22.
//

import Foundation
import UIKit

final class ImageProvider {

    static var shared = ImageProvider()
    
    // MARK: - Properties
    
    private let token: RequestCancellationToken
    private let cache: NSCache<NSString, NSData>
    private let repository: ImageRepository
    
    fileprivate enum CachedImage {
        case exists(data: NSData)
        case new
    }
    
    // MARK: - Initializers
    
    init() {
        self.token = RequestCancellationToken()
        self.repository = ImageRepository(networkClient: HTTPClient())
        self.cache = NSCache<NSString, NSData>()
    }
    
    // MARK: - Methods
    
    func setImage(with url: URL,
                  callback: @escaping (UIImage?) -> Void) {
        let uuid = url.hashValue.description
        let cachedImage = CachedImage(with: NSString(string: uuid), in: cache)
        switch cachedImage {
        case .exists(let data):
            //print("Exists: \(data)")
            callback(UIImage(data: data as Data))
        case .new:
            //print("New: ")
            repository.downloadImage(for: url, cancelledBy: token) { (data) in
                guard let data = data else {return}
                self.cache.setObject(data as NSData, forKey: NSString(string: uuid))
                callback(UIImage(data: data))
            }
        }
    }
}

extension ImageProvider.CachedImage {
    init(with uuid: NSString, in cache: NSCache<NSString, NSData>) {
        if let data = cache.object(forKey: uuid) {
            self = .exists(data: data)
        } else {
            self = .new
        }
    }
}
