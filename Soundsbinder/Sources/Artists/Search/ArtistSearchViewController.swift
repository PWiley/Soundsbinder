//
//  ArtistSearchViewController.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 14/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
//

import UIKit

final class ArtistSearchViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties

    var viewModel: ArtistSearchViewModel!

    var imageProvider: ImageProvider!

    private lazy var source: ArtistSearchDataSource = {
        return ArtistSearchDataSource(imageProvider: imageProvider)
    }()

    private lazy var searchController = UISearchController(searchResultsController: nil)

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = source
        collectionView.delegate = source

        bind(to: source)
        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController

        searchController.searchBar.delegate = self

        definesPresentationContext = true
    }

    private func bind(to source: ArtistSearchDataSource) {
        source.didSelectItemAtIndex = viewModel.didSelectItem
    }

    private func bind(to viewModel: ArtistSearchViewModel) {
        viewModel.visibleItems = { [weak self] visibleItems in
            self?.source.update(with: visibleItems)
            DispatchQueue.main.async {
                self?.collectionView.contentOffset = .zero
                self?.collectionView.reloadData()
            }
        }

        viewModel.searchPlaceHolder = { [weak self] placeholder in
            self?.searchController.searchBar.placeholder = placeholder
        }
    }
}

extension ArtistSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.didSearchArtist(with: text)
        DispatchQueue.main.async {
            self.searchController.isActive = false
        }
    }
}
