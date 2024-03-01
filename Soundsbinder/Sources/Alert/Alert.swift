//
//  Alert.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

enum AlertType: Equatable {
    case networkError
}

struct Alert: Equatable {
    let title: String
    let message: String
}

extension Alert {
    init(type: AlertType) {
        switch type {
        case .networkError:
            self = Alert(title: "Alert", message: "A very very bad thing happened.. 🙈")
        }
    }
}
