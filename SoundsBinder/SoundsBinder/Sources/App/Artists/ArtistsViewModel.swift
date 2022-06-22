//
//  ArtistsViewModel.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import Foundation


final class ArtistsViewModel {
    
    // MARK: - Private Properties
    
    private let artistRepository: ArtistsRepositoryType
    private let albumRepository: AlbumRepositoryType
    
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
    private var delegate: ArtistViewControllerDelegate?

    // MARK: - Init
    
    init(artistRepository: ArtistsRepositoryType, albumRepository: AlbumRepositoryType, delegate: ArtistViewControllerDelegate) {
        self.artistRepository = artistRepository
        self.albumRepository = albumRepository
        self.delegate = delegate
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        screenTitle?("Artists")
        artists = []
        //artist = Artist(id: 1, name: "artist", pictureMedium: "picture", tracklist: "tracklist")
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
        //self.artist = artists[index]
        albumRepository.searchAlbum(for: artists[index].tracklist) { [weak self] result in
            switch result {
            case .success(let tracks):
                self?.tracks = tracks
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Outputs
    
    var screenTitle: InputClosure<String>?
    var items: InputClosure<[Artist]>?
    var album: InputClosure<[Track]>?
    
}
