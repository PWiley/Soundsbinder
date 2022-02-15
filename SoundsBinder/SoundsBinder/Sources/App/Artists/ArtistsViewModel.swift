//
//  ArtistsViewModel.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import Foundation

final class ArtistsViewModel {
    
    // MARK: - Properties
    
    private let repository: ArtistsRepositoryType
    private var artists: [Artist] = [] {
        didSet {
            items?(artists)
        }
    }
    
    // MARK: - Init
    
    init(repository: ArtistsRepositoryType) {
        self.repository = repository
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        screenTitle?("Artists Search")
        artists = []
    }
    
    func didPressSearch(for name: String) {
        repository.searchArtists(for: name) { [ weak self] result in
            switch result {
            case .success(let artists):
                print(artists)
                self?.artists = artists
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
    
    func didPressCellForDetail(indexPath: Int) {
        
    }
    
    // MARK: - Outputs
    
    var screenTitle: InputClosure<String>?
    var items: InputClosure<[Artist]>?
    
}
