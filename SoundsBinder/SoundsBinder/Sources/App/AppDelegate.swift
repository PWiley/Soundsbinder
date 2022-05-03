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
    
    // MARK: - Private Properties
    
    private var coordinator: AppCoordinator!
    private var context: Context!
    private var imageCache: NSCache<NSString, NSData>!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        imageCache = NSCache<NSString, NSData>()

        context = .build()
    
        coordinator = AppCoordinator(presenter: self, context: context)
        coordinator.start()

        return true
    }
    
}

