//
//  AlbumCoordinator.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 17.03.22.
//

import Foundation
import UIKit

final class AlbumCoordinator {
    
    // MARK: - Properties
    
    var presenter: UINavigationController
    var screens: Screens
    
    // MARK: - Initializers
    
    init(presenter: UINavigationController, context: Context) {
        self.presenter = presenter
        self.screens = Screens(context: context)
    }
    
    // MARK: - Coordinator
    
    func start() {
        
    }
    
    private func showSearch() {
    
    }
}
