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
    
    private var artist: Artist = Artist(id: 1, name: "artist", pictureMedium: "picture", tracklist: "tracklist") {
        didSet {
            artistAlbum?(artist)
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
        self.artist = artists[index]
        albumRepository.searchAlbum(for: artist.tracklist) { [weak self] result in
            switch result {
            case .success(let album):
                self.artistAlbum = album
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Outputs
    
    var screenTitle: InputClosure<String>?
    var items: InputClosure<[Artist]>?
    var artistAlbum: InputClosure<Artist>?
    
}
