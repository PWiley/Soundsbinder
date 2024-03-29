//
//  ArtistSearchDataSource.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import UIKit

struct VisibleArtist: Equatable {
    let name: String
    let pictureURLString: String
}

final class ArtistSearchDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    typealias Item = ArtistSearchViewModel.VisibleItem

    // MARK: - Private properties
    
    private var items: [Item] = []

    fileprivate enum VisibleItem {
        case artist(visibleArtist: VisibleArtist)
    }

    // MARK: - Public properties

    var imageProvider: ImageProvider

    var didSelectItemAtIndex: ((Int) -> Void)?

    func update(with items: [Item]) {
        self.items = items.map { item in
            switch item {
            case .artist(visibleArtist: let artist):
                return .artist(visibleArtist: artist)
            }
        }
    }

    // MARK: - Initializer

    init(imageProvider: ImageProvider) {
        self.imageProvider = imageProvider
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        guard index < items.count else {
            fatalError()
        }

        switch items[index] {
        case .artist(visibleArtist: let artist):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCollectionViewCell",
                                                          for: indexPath) as! ArtistCollectionViewCell
            cell.configure(with: artist, imageProvider: imageProvider)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        guard indexPath.item < items.count else {
            fatalError()
        }

        didSelectItemAtIndex?(index)
    }
}

extension ArtistSearchDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 32) / 3
        return CGSize(width: width, height: width + 60.0)
    }
}
