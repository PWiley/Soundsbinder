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
        let client = HTTPClient()
        let parser = JSONParser()
        let repository = ArtistsRepository(client: client, parser: parser)
        let viewModel = ArtistsViewModel(repository: repository)
        let initialViewController = ArtistsViewController(viewModel: viewModel)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.makeKeyAndVisible()

        self.window!.rootViewController = UINavigationController(
            rootViewController: initialViewController
        )

        return true
    }
    
}

