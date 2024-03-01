//
//  JSONBodyEncoder.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

final class JSONBodyEncoder {
    
    // MARK: - Encode
    
    func encode(request: inout URLRequest, parameters: HTTPRequestParameters) throws {
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters.value)
    }
}
