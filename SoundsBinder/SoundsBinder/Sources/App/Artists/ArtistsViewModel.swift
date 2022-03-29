//
//  ArtistsViewModel.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import Foundation

final class ArtistsViewModel {
    
    // MARK: - Private Properties
    
    private let repository: ArtistsRepositoryType
    private var artists: [Artist] = [] {
        didSet {
            items?(artists)
        }
    }
    
    private var delegate: ArtistViewControllerDelegate?

    // MARK: - Init
    
    init(repository: ArtistsRepositoryType) {
        self.repository = repository
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
                //print(artists)
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
        delegate?.didSelect(artist: artist)
    }
    
    // MARK: - Outputs
    
    var screenTitle: InputClosure<String>?
    var items: InputClosure<[Artist]>?
    
}
