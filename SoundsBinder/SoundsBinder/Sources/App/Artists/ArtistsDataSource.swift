//
//  ArtistsDataSource.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02.02.22.
//

import UIKit

final class ArtistsDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Private Properties
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 3
    private let reuseIdentifier = "ArtistCell"
    private var catalogArtists: [VisibleArtist] = []
    
    // MARK: - Public Properties
    
    var imageProvider: ImageProvider
    var didSelectItemAtIndex: ((Int) -> Void)?
    
    // MARK: - Initialisers
    
    init(imageProvider: ImageProvider) {
        self.imageProvider = imageProvider
    }
    
    // MARK: - UICollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalogArtists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let artistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ArtistCell
        artistCell.configure(artist: catalogArtists[indexPath.row], imageProvider: imageProvider)
        return artistCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        guard indexPath.item < catalogArtists.count else {
            fatalError()
        }
        didSelectItemAtIndex?(index)
    }
    
    func update(with catalogArtists: [Artist]) {
        self.catalogArtists = catalogArtists.map {
            VisibleArtist(artist: $0)
        }
    }
    
}

extension ArtistsDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int)-> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
