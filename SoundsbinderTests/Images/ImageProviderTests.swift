//
//  ImageProviderTests.swift
//  SoundsbinderTests
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

@testable import Soundsbinder
import XCTest

final class ImageProviderTests: XCTestCase {

    let mockRepository = MockImageRepository()

    func testWhenSetImageFromURL_DataIsCorrectlyReturned() {
        let cache = NSCache<Key, Object>()
        let imageProvider = ImageProvider(repository: mockRepository,
                                          cache: cache)
        let data =  UIImage(named: "play")!.pngData()!
        mockRepository.data = data

        let expectation = self.expectation(description: "callback block was executed")
        let token = RequestCancellationToken()

        imageProvider.setImage(for: URL(string: "https://www.apple.com/")!,
                               cancelledBy: token,
                               callback: { image in
                                XCTAssertEqual(image?.pngData(), UIImage(data: data)?.pngData())
                                expectation.fulfill()
        })
    
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
