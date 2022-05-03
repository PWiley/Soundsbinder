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
        let repository = ArtistsRepository(client: context.client)
        let viewModel = ArtistsViewModel(repository: repository, delegate: delegate)
        return ArtistsViewController(viewModel: viewModel)
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
//    func createAlbumDetailsViewController(artist: Artist) -> UIViewController {
//       let viewController = AlbumDetailsViewController()
//       return viewController
//    }
}
