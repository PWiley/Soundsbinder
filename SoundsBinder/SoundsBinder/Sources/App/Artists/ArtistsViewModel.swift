//
//  ArtistsViewModel.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import Foundation
import UIKit

final class ArtistsViewModel {
    
    // MARK: - Private Properties
    
    private let repository: ArtistsRepositoryType
    private let imageRepository = ImageRepository()
    
    private let cache = NSCache<NSString , UIImage>()
    
    private var artists: [Artist] = [] {
        didSet {
            items?(artists)
        }
    }
    
    private var delegate: ArtistViewControllerDelegate?

    // MARK: - Init
    
    init(repository: ArtistsRepositoryType, delegate: ArtistViewControllerDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        screenTitle?("Artists")
        artists = []
    }
    
    func didPressSearch(for name: String) {
        repository.searchArtists(for: name) { [ weak self] result in
            switch result {
            case .success(let artists):
                self?.artists = artists
                self?.cacheArtistsData(artists: artists)
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
    
    func didSelectItem(index: Int) {
        guard artists.indices.contains(index) else {
            print("FatalError")
            return
        }
        let artist = artists[index]
        delegate?.didSelect(artist: artist)
    }
    
    func cacheArtistsData(artists: [Artist]) {
        
        for artist in artists {
            
//            if let image = self.cache.object(forKey: artist.pictureMedium as! NSString) {
//                print("Using a cached image for item: \(String(describing: artist.pictureMedium))")
//                VisibleArtist(name: artist.name,
//                              pictureURLString: artist.pictureMedium,
//                              imageData: image.pngData())
//            } else if let imageUrl = artist.pictureMedium {
//                print("downloading an image for item: \(String(describing: artist.pictureMedium))")
//                imageRepository.downloadImage(for: URL(string: imageUrl)!, cancelledBy: RequestCancellationToken(), callback: { [weak self] data in
//                    DispatchQueue.main.async {
//                        guard data != nil else { return }
//                        self?.cache.setObject(UIImage(data: data!)!, forKey: artist.pictureMedium! as NSString)
//                    }
//                })
//            }

        }
        
       
        
    }
    
   
    
    // MARK: - Outputs
    
    var screenTitle: InputClosure<String>?
    var items: InputClosure<[Artist]>?
    
}
