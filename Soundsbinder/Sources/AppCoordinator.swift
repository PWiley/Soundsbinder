//
//  AppCoordinator.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 14/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Private properties

    private var presenter: UIWindow

    private let context: Context

    private var artistSearchCoordinator: ArtistCoordinator?
    
    // MARK: - Initializer

    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter
        self.context = context
    }
    
    // MARK: - Coordinator
    func start() {
        presenter.rootViewController = UIViewController()

        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }

        showSearch()
    }
    
    private func showSearch() {
        artistSearchCoordinator = ArtistCoordinator(presenter: presenter, context: context)
        artistSearchCoordinator?.start()
    }
}
