//
//  ArtistsDataSource.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02.02.22.
//

import UIKit

final class ArtistsDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Private Properties
    
    private var catalogArtists: [VisibleArtist] = []
    
    // MARK: - Public Properties
    
    var didSelectItemAtIndex: ((Int) -> Void)?
    
    // MARK: - Initialisers
    
    init(collectionView: UICollectionView, viewModel: ArtistsViewModel) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - UICollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalogArtists.count// How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let artistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ArtistCell
        artistCell.configure(with: catalogArtists[indexPath.row])
       
        return artistCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        guard indexPath.item < catalogArtists.count else {
            fatalError()
        }
        didSelectItemAtIndex?(index)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let height = collectionView.frame.size.height
//        let width = collectionView.frame.size.width
//        // in case you you want the cell to be 40% of your controllers view
//        return CGSize(width: width * 0.1, height: height * 0.1)
//    }
    

    func update(with catalogArtists: [Artist]) {
        self.catalogArtists = catalogArtists.map {
            VisibleArtist(artist: $0)
            }
    }
}

