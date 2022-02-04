//
//  ArtistsDataSource.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02.02.22.
//

import UIKit

final class ArtistsDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private var catalogArtists: [VisibleArtist] = []
    
    // MARK: - Initialisers
    
    init(collectionView: UICollectionView, viewModel: ArtistsViewModel) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - UICollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return catalogArtists.count// How many cells to display
        return 2// How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let artistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ArtistCell
        //artistCell.configure(with: catalogArtists[indexPath.row])
        artistCell.backgroundColor = .brown
        return artistCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        viewModel.didPressCellForDetail(indexPath: indexPath.item)
    }
    
    func update(with catalogArtists: [Artist]) {
        self.catalogArtists = catalogArtists.map {
            VisibleArtist(artist: $0)
            }
    }
}

