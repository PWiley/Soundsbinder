//
//  HTTPResponse.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

final class HTTPResponse<T> {
    
    let result: Result<T>
    
    let originalData: Data?
    
    let statusCode: Int?
    
    init(result: Result<T>, originalData: Data?, statusCode: Int?) {
        self.result = result
        self.originalData = originalData
        self.statusCode = statusCode
    }
}


