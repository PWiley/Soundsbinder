////
////  imageProvider.swift
////  SoundsBinder
////
////  Created by Patrick Wiley on 02.02.22.
////
//
//import Foundation
//
//final class ImageProvider {
//
//    // MARK: - Private properties
//
//    private let repository: ImageRepositoryType
//
//    fileprivate enum CachedImage {
//        case exists(data: NSData)
//        case new
//    }
//
//    // MARK: - Initializer
//
//    init(repository: ImageRepositoryType, cache: NSCache<Key, Object>) {
//        self.repository = repository
//      
//    }
//
//    // MARK: - Public
//
//    func setImage(for url: URL, cancelledBy cancellationToken: RequestCancellationToken, callback: @escaping (UIImage?) -> Void) {
//        
//        
//            repository.downloadImage(for: url, cancelledBy: cancellationToken) { (data) in
//                guard let data = data else { return }
//                self.cache.setObject(Object(data: data), forKey: Key(string: uid))
//                callback(UIImage(data: data))
//            
//        }
//    }
//}
