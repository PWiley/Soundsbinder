//
//  ArtistsViewController.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import UIKit
import SnapKit

final class ArtistsViewController: UIViewController {
   
    // MARK: - Properties
    
    let viewModel:  ArtistsViewModel!
    
    private lazy var source = ArtistsDataSource(collectionView: collectionView,
                                                viewModel: viewModel)
    
    private lazy var searchController = UISearchController(searchResultsController: nil)
        
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 40, height: 40)
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
        viewModel.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        bind(to: viewModel)
        viewModel.viewWillAppear()
        view.backgroundColor = .white
        
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Artist Search"
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController

        searchController.searchBar.delegate = self

        definesPresentationContext = true
    }
    
    // MARK: - Private
    
    private func setupLayout() {
    
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            //$0.top.equalTo(searchController.searchBar.snp.top)
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func bind(to viewModel: ArtistsViewModel) {
        viewModel.items = { [weak self] items in
            DispatchQueue.main.async {
                self?.source.update(with: items)
                self?.collectionView.reloadData()
            }
        }
    }

    // MARK: - Actions
    
}

extension ArtistsViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let name = searchController.searchBar.text else { return }
        print(name)
        print("Clicked")
    }
    
}
