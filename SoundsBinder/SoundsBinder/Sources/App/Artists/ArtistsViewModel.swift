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
    
    let cache = NSCache<NSString , UIImage>()
    
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
        repository.searchArtists(for: name) { [weak self] result in
            switch result {
            case .success(let artists):
                if artists.isEmpty == false {
                    self?.artists = (self?.updateImageData(artists: artists))!
                }
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
    
    func updateImageData(artists: [Artist]) -> [Artist] {
        for artist in artists {
            guard let url = URL(string: artist.pictureMedium!) else {return}
            imageRepository.downloadImage(for: url) { [weak self] result in
                switch result {
                case .some(let imageData):
                    artist.imageData = imageData.pngData()
                case .none():
                    assertionFailure(error.localizedDescription)
                }
            }
        }
    }
        
    func cacheImageArtist(image: UIImage?, imageUrl: String) {
        guard let image = image else {return}
        cache.setObject(image, forKey: imageUrl as NSString)
    }
    
    func fetchData(imageUrl: URL) {
        imageRepository.downloadImage(for: imageUrl) { [weak self] result in
            switch result {
            case .none:
                print("Not possible to retrieve the data")
            case .some(let image):
                print("Everything was perfect")
            }
        }
    }
    
   
    
    // MARK: - Outputs
    
    var screenTitle: InputClosure<String>?
    var items: InputClosure<[Artist]>?
    
}
