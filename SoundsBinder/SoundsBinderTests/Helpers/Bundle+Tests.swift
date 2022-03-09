//
//  Bundle+Tests.swift
//  SoundsBinderTests
//
//  Created by Patrick Wiley on 20.01.22.
//
import Foundation

public extension Bundle {

    class var test: Bundle {
        Bundle(for: BundleFinder.self)
    }
}

private class BundleFinder {}

