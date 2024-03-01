//
//  Promise.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

class Promise<T> {
    
    enum Result {
        case value(T, Int?)
        case error(Error, T?, Int?)
    }
    
    // MARK: - Properties
    
    private var callback: ((Result) -> Void)?
    
    fileprivate var result: Result? {
        didSet {
            // Emit the signal when the result will be set to non-nil value.
            result.map(emit)
        }
    }
    
    // MARK: - Public

    func resolve(with value: T, statusCode: Int?) {
        result = .value(value, statusCode)
    }
    
    func reject(with error: Error, value: T?, statusCode: Int?) {
        result = .error(error, value, statusCode)
    }
    
    func observe(with callback: @escaping (Result) -> Void) {
        self.callback = callback
        
        // If the result has been already set, call the callback.
        result.map(emit)
    }
    
    // MARK: - Private
    
    private func emit(result: Result) {
        callback?(result)
    }
}
