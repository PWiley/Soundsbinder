//
//  ArtistDetailsDataSource.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import UIKit

struct VisibleTrack: Equatable {
    let position: Int
    let title: String
    let albumTitle: String
    let isPlaying: Bool
}

final class ArtistDetailsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    typealias  Item = ArtistDetailsViewModel.VisibleItem

    // MARK: - Private properties

    private var items: [Item] = []

    fileprivate enum VisibleItem {
        case track(visibleTrack: VisibleTrack)
    }

    // MARK: - Public properties

    var didPressPlayStopAtIndex: ((Int) -> Void)?

    func update(with items: [Item]) {
        self.items = items.map { item in
            switch item {
            case .track(visibleTrack: let track):
                return .track(visibleTrack: track)
            }
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.item
        guard index < items.count else {
            fatalError()
        }

        switch items[index] {
        case .track(visibleTrack: let track):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrackTableViewCell", for: indexPath) as! TrackTableViewCell
            let viewModel = TrackViewModel(with: track, at: index, delegate: self)
            cell.configure(with: viewModel)
            return cell
        }
    }
}

extension ArtistDetailsDataSource: TrackTableViewCellDelegate {
    func trackTableViewCellDidPressPlayStop(at index: Int) {
        didPressPlayStopAtIndex?(index)
    }
}
