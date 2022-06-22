//
//  AlbumViewModel.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.05.22.
//

import Foundation

final class AlbumViewModel {
    
    // MARK: - Private Properties
    
    private let repository: AlbumRepositoryType
    private var album: Album? = nil {
        didSet {
            item?(album!)
        }
    }
    
    // MARK: - Init
    
    init(repository: AlbumRepositoryType) {
        self.repository = repository
    }
    // MARK: - Inputs
    func viewDidLoad() {
        album = nil
    }
    
    func didPressAlbum(for artist: Artist) {
        print(artist.tracklist)
//        repository.searchAlbum(for: URL(String: artist.tracklist)) {
//            [weak self] result in
//            switch result {
//            case .success(let album):
//                self?.album = album
//            case .failure(let error):
//                assertionFailure(error.localizedDescription)
//            }
//        }
    }
    // MARK: - Outputs
    
    var item: InputClosure<Album>?
}
