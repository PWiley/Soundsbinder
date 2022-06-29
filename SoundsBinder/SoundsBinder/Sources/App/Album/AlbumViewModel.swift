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
    private var tracks: [Track]? = [] {
        didSet {
            items?(tracks!)
        }
    }

    private let trackList: String
    
    // MARK: - Init
    
    init(repository: AlbumRepositoryType, trackList: String) {
        self.repository = repository
        self.trackList = trackList
    }
    // MARK: - Inputs
    
   
    func viewDidLoad() {
        tracks = []
        didPressAlbum(for: trackList)
    }
    
    func didPressAlbum(for trackList: String) {
        repository.searchAlbum(for: URL(string: trackList)!) {
            [weak self] result in
            switch result {
            case .success(let tracks):
                self?.tracks = tracks
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
    // MARK: - Outputs
    
    var items: InputClosure<[Track]>?
}
