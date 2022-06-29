//
//  AppCoordinator.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 17.03.22.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    // MARK: - Private Properties
    
    private unowned var presenter: AppDelegate
    private let context: Context
    private var artistCoordinator: ArtistCoordinator?

    // MARK: - Initialisers
    
    init(presenter: AppDelegate, context: Context) {
        self.presenter = presenter
        self.context = context
    }
    
    // MARK: - Coordinator
    
    func start() {
        presenter.window = UIWindow(frame: UIScreen.main.bounds)
        presenter.window?.makeKeyAndVisible()
        showArtist()
    }
    
    private func showArtist() {
        artistCoordinator = ArtistCoordinator(presenter: presenter.window!, context: context)
        artistCoordinator?.start()
    }
}
