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
    let parser: RequestCancellationToken
    
    // MARK: - Methods
    
    static func buildContext() -> Context {
        return Context()
    }
    
    // MARK: - Initialisers
    
    init() {
        client = HTTPClient()
        parser = RequestCancellationToken()
    }
}
