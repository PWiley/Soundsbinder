//
//  ArtistsViewController.swift
//  Deezer
//
//  Created by Patrick Wiley on 02/12/2021.
//

import UIKit
import SnapKit

final class ArtistsViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        // Adding Generic custom cell
        return tableView
    }()
    
    private let viewModel: ArtistsViewModel

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
        searchController.searchBar.scopeButtonTitles = ["Artist", "Album"]
        searchController.searchBar.backgroundColor = .red
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        
        definesPresentationContext = true
        setupLayout()
        bindViewModel()
        viewModel.viewDidLoad()
    }

    // MARK: - Private

    private func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    private func bindViewModel() {
        
    }
}

extension ArtistsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


