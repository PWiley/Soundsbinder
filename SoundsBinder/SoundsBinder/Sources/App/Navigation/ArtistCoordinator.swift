//
//  ArtistCoordinator.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 17.03.22.
//

import Foundation
import UIKit

final class ArtistCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UIWindow
    private let screens: Screens
    private var navigationController: UINavigationController?
    
    // MARK: - Initialisers
    
    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter
        self.screens = Screens(context: context)
    }
    
    // MARK: - Coordinator
    
    func start() {
       showSearch()
    }
    
    private func showSearch() {
        let viewController = screens.createArtistViewController(delegate: self)
        navigationController = UINavigationController(rootViewController: viewController)
        guard let navigationController = navigationController else {
            return
        }
        presenter.rootViewController = navigationController
    }

    private func showAlbumView(for trackList: String) {
        let viewController = screens.createAlbumViewController(trackList: trackList)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ArtistCoordinator: ArtistsViewModelDelegate {
    func didSelect(tracklist: String) {
        showAlbumView(for: tracklist)
    }
}
