//
//  ImageRepository.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02.02.22.
//

import Foundation

protocol ImageRepositoryType {
    func downloadImage(for url: URL, callback: @escaping (Data?) -> Void)
}

final class ImageRepository: ImageRepositoryType {

    // MARK: - Properties

    private let networkClient: HTTPClient
    private let token = RequestCancellationToken()
    private let cache = NSCache<NSNumber, NSData>()
    init() {
        networkClient = HTTPClient()
    }

    // MARK: - ImageRepositoryType
    
    
    func downloadImage(for url: URL,
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

//
//if let image = self.cache.object(forKey: artist.pictureMedium as! NSString) {
//    print("Using a cached image for item: \(String(describing: artist.pictureMedium))")
//    VisibleArtist(name: artist.name,
//                  pictureURLString: artist.pictureMedium,
//                  imageData: image.pngData())
//} else if let imageUrl = artist.pictureMedium {
//    print("downloading an image for item: \(String(describing: artist.pictureMedium))")
//    imageRepository.downloadImage(for: URL(string: imageUrl)!, cancelledBy: RequestCancellationToken(), callback: { [weak self] data in
//        DispatchQueue.main.async {
//            guard data != nil else { return }
//            self?.cache.setObject(UIImage(data: data!)!, forKey: artist.pictureMedium! as NSString)
//        }
//    })
//}
