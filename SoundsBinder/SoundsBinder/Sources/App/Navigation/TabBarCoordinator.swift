//
//  TabBarCoordinator.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 17.03.22.
//


import UIKit

enum ViewControllerItem: Int {
    case artist = 0
    case album
    case other
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}


extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty, item.rawValue < items.count, item.rawValue >= 0 else {
                fatalError("Item does not exists")
            }
            return items[item.rawValue]
        }
    }
}

fileprivate class TabBarSource: TabBarSourceType {
    
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)
    ]


    init() {

        self[.artist].tabBarItem = UITabBarItem(title: "Artist", image: nil, selectedImage: nil)
        self[.album].tabBarItem = UITabBarItem(title: "Album", image: nil, selectedImage: nil)
        self[.other].tabBarItem = UITabBarItem(title: "Other", image: nil, selectedImage: nil)
        
    }
}

final class TabBarCoordinator: NSObject, UITabBarControllerDelegate {
    
    // MARK: - Properties
    
    private let presenter: UIWindow
    
    private let tabBarController: UITabBarController
    
    private var artistCoordinator: ArtistCoordinator?
    
    //private var albumCoordinator: AlbumCoordinator?
    
    private var tabBarSource: TabBarSourceType = TabBarSource()

    private let context: Context

    // MARK: - Init
    
    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter
        self.context = context
        
        
        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.artist]
        
        super.init()
        
        tabBarController.delegate = self
    }
    
   // MARK: - Coordinator
    
    func start() {
        presenter.rootViewController = tabBarController
        showSearchArtist()
    }
    
    func showSearchArtist() {
        artistCoordinator = ArtistCoordinator(presenter: tabBarSource[.artist],
                                              context: context)
        artistCoordinator?.start()
    }
    
//    func showSearchAlbum() {
//        albumCoordinator = AlbumCoordinator(presenter: tabBarSource[.album],
//                                                    context: context)
//        albumCoordinator?.start()
//    }
    
}

extension TabBarCoordinator {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("Selected ViewController Index Out Of range")
        }

        switch item {
        case .artist:
            showSearchArtist()
        case .album:
            //showSearchAlbum()
            print("Album")
        case .other:
            print("Hello")
        }
    }
}
