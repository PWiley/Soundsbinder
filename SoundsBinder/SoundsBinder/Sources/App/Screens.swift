//
//  Screens.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 22.02.22.
//

import UIKit

final class Screens {
    
    // MARK: - Properties
    
    private let context: Context
    
    // MARK: - Initialisers
    
    init(context: Context) {
        self.context = context
    }

}

// MARK: - Artist

extension Screens {
    func createArtistViewController(delegate: ArtistsViewModelDelegate) -> UIViewController {
        let artistRepository = ArtistsRepository(client: context.client)
        let viewModel = ArtistsViewModel(artistRepository: artistRepository, delegate: delegate)
        return ArtistsViewController(viewModel: viewModel)
    }
}

// MARK: - Album


extension Screens {
    func createAlbumViewController(trackList: String) -> UIViewController {
        let repository = AlbumRepository(client: context.client)
        let viewModel = AlbumViewModel(repository: repository, trackList: trackList)
        let viewController = AlbumViewController(viewModel: viewModel)
       return viewController
    }
}
