//
//  MockFileManager.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

@testable import Soundsbinder
import Foundation

final class MockFileManager: FileManagerType {

    var urls: [URL] = []

    func fileExists(atPath path: String) -> Bool {
        return urls.contains(URL(fileURLWithPath: path).deletingLastPathComponent())
    }
    
    func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL] {
        return urls
    }
    
    func moveItem(at srcURL: URL, to dstURL: URL) throws {
        urls = [srcURL.deletingLastPathComponent()]
    }
}
