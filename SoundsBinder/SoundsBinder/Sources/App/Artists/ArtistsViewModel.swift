//
//  ArtistsViewModel.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import Foundation

protocol ArtistsViewModelDelegate: AnyObject {
    func didSelect(tracklist: String)
}

final class ArtistsViewModel {
    
    // MARK: - Private Properties
    
    private let artistRepository: ArtistsRepositoryType
    
    private var artists: [Artist] = [] {
        didSet {
            items?(artists)
        }
    }
    
    private var tracks: [Track] = [] {
        didSet {
            album?(tracks)
        }
    }

    private weak var delegate: ArtistsViewModelDelegate?

    // MARK: - Init
    
    init(artistRepository: ArtistsRepositoryType, delegate: ArtistsViewModelDelegate) {
        self.artistRepository = artistRepository
        self.delegate = delegate
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        screenTitle?("Artists")
        artists = []
    }
    
    func didPressSearch(for name: String) {
        artistRepository.searchArtists(for: name) { [weak self] result in
            switch result {
            case .success(let artists):
                self?.artists = artists
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
        delegate?.didSelect(tracklist: artist.tracklist)
    }
    
    // MARK: - Outputs
    
    var screenTitle: InputClosure<String>?
    var items: InputClosure<[Artist]>?
    var album: InputClosure<[Track]>?
}
