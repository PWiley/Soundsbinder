//
//  ArtistsViewModel.swift
//  Deezer
//
//  Created by Patrick Wiley on 02/12/2021.
//

import Foundation

final class ArtistsViewModel {

    // MARK: - Properties

    private let repository: ArtistsRepositoryType

    struct Item {
    }

    // MARK: - Init

    init(repository: ArtistsRepositoryType) {
        self.repository = repository
    }

    // MARK: - Inputs

    func viewDidLoad() {
        artists?([])
    }

    func didPressSearch(for name: String) {
        repository.searchArtists(
            for: name,
               callback: { [weak self] result in
                   switch result {
                   case .success(let response):
                       self?.artists?([Item()])
                   case .failure(let error):
                       print(error)
                   }
               }
        )
    }

    // MARK: - Outputs

    var artists: (([Item]) -> Void)?
}
