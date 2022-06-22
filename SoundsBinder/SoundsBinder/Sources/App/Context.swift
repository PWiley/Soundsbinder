//
//  Context.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 22.02.22.
//

import Foundation

class Context {
    
    // MARK: - Properties
    
    let client: HTTPClient

    // MARK: - Methods
    
    static func build() -> Context { Context() }
    
    // MARK: - Initialisers
    
    private init() {
        self.client = HTTPClient()
    }
}
