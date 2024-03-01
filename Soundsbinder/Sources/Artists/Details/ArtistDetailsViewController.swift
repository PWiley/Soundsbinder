//
//  ArtistDetailsViewController.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 14/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
//

import UIKit

final class ArtistDetailsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var viewModel: ArtistDetailsViewModel!

    private lazy var source = ArtistDetailsDataSource()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = source
        tableView.delegate = source

        bind(to: source)
        bind(to: viewModel)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }

    private func bind(to source: ArtistDetailsDataSource) {
        source.didPressPlayStopAtIndex = viewModel.didPressPlayStop
    }
    
    private func bind(to viewModel: ArtistDetailsViewModel) {
        viewModel.titleText = { [weak self] title in
            DispatchQueue.main.async {
                self?.title = title
            }
        }

        viewModel.visibleItems = { [weak self] visibleItems in
            self?.source.update(with: visibleItems)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
