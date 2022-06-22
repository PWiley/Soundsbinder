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
    
    var presenter: UINavigationController
    var screens: Screens
    
    // MARK: - Initialisers
    
    init(presenter: UINavigationController, context: Context) {
        self.presenter = presenter
        self.screens = Screens(context: context)
    }
    
    // MARK: - Coordinator
    
    func start() {
       showSearch()
    }
    
    private func showSearch() {
        let viewController = screens.createArtistViewController(delegate: self)
        presenter.viewControllers = [viewController]
    }
}

extension ArtistCoordinator: ArtistViewControllerDelegate {
    func didSelect(artist: Artist) {
        let viewController = screens.createAlbumViewController()
        presenter.pushViewController(viewController,animated: false)
    }
}
