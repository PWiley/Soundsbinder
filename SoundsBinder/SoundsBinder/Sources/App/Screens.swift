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

protocol ArtistViewControllerDelegate: AnyObject {
    func didSelect(artist: Artist)
}

extension Screens {
    func createArtistViewController(delegate: ArtistViewControllerDelegate) -> UIViewController {
        let repository = ArtistsRepository(client: context.client, parser: context.parser)
        let viewModel = ArtistsViewModel(repository: repository)
        let viewController = ArtistsViewController(viewModel: viewModel)
        return viewController
    }
}

// MARK: - Album

//protocol AlbumViewControllerDelegate: AnyObject {
//    func didSelect(album: Album)
//}
//
//extension Screens {
//    func createAlbumViewController(delegate: AlbumViewControllerDelegate) -> UIViewController {
//        let repository = AlbumsRepository(client: context.client, parser: context.parser as! JSONParserType)
//        let viewModel = AlbumsViewModel(repository: repository)
//        let viewController = AlbumsViewController(viewModel: viewModel)
//        return viewController
//    }
//}

// MARK: - Details


extension Screens {
    func createDetailsViewController(artist: Artist) -> UIViewController {
        //let repository = AlbumsRepository(client: context.client, parser: context.parser as! JSONParserType)
        let viewModel = DetailsViewModel(artist: artist)
        let viewController = DetailsViewController(viewModel: viewModel)
        return viewController
    }
}
