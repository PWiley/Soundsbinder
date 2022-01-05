//
//  Helper.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 28.12.21.
//

import Foundation

typealias VoidClosure = () -> Void
typealias InputClosure<T> = (T) -> Void

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
