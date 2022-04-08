//
//  ArtistsViewController.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import UIKit
import SnapKit

final class ArtistsViewController: UIViewController {
   
    // MARK: - Private Properties
    
    private let viewModel:  ArtistsViewModel!
    private lazy var source = ArtistsDataSource(collectionView: collectionView,
                                                viewModel: viewModel)

    private lazy var searchController = UISearchController(searchResultsController: nil)
        
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        //layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
        collectionView.register(ArtistCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()

    private var items: [Artist] = []
    
    // MARK: - Init
    
    init(viewModel: ArtistsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bind(to: viewModel)
        bind(to: source)
        viewModel.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        bind(to: viewModel)
        bind(to: source)
    }
   
    // MARK: - Private
    
    private func setupLayout() {
        collectionView.backgroundColor = .white
        
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
           
        }
    }
  
    private func bind(to viewModel: ArtistsViewModel) {
        viewModel.items = { [weak self] items in
            DispatchQueue.main.async {
                self?.source.update(with: items)
                self?.collectionView.contentOffset = .zero
                self?.collectionView.reloadData()
            }
        }

        viewModel.screenTitle = { [weak self] title in
            self?.title = title
        }
    }
    
    private func bind(to source: ArtistsDataSource) {
        source.didSelectItemAtIndex = viewModel.didSelectItem
    }
    
    private func handleTableViewData() {
        if let _ = self.viewModel.items {
            collectionView.reloadData()
        }
    }
    
}

extension ArtistsViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let name = searchController.searchBar.text else { return }
        viewModel.didPressSearch(for: name)
    }
    
}
