//
//  AppDelegate.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 21.12.21.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let repository = ArtistsRepository()
        let viewModel = ArtistsViewModel(repository: repository)
        let initialViewController = ArtistsViewController(viewModel: viewModel)
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        return true
    }

    
}

