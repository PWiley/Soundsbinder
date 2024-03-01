//
//  AppDelegate.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 14/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
//

import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: AppCoordinator!
    var context: Context!
    var window: UIWindow?

    // MARK: - Private properties
    
    private var imageCache: NSCache<Key, Object>!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
        imageCache = NSCache<Key, Object>()
        
        let client = HTTPClient(engine: .urlSession(.default))

        let requestBuilder = SBRequestBuilder()

        let imageRepository = ImageRepository(networkClient: client)
        let imageProvider = ImageProvider(repository: imageRepository,
                                          cache: self.imageCache)

        let audioPlayerRepository = AudioPlayerRepository(networkClient: client)
        let audioPlayer = AudioPlayer(repository: audioPlayerRepository)
        
        context = Context(networkClient: client,
                          requestBuilder: requestBuilder,
                          imageProvider: imageProvider,
                          audioPlayer: audioPlayer)

        coordinator = AppCoordinator(presenter: window!,
                                     context: context)
        coordinator.start()
        FirebaseApp.configure()
        return true
    }
}


