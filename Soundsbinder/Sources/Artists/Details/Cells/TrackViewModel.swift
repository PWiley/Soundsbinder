//
//  TrackViewModel.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import Foundation

final class TrackViewModel {

    // MARK: - Properties

    private let visibleTrack: VisibleTrack

    private let index: Int

    private weak var delegate: TrackTableViewCellDelegate?

    // MARK: - Properties

    enum AudioState: Equatable {
        case play
        case stop
    }

    // MARK: - Initializer

    init(with visibleTrack: VisibleTrack, at index: Int, delegate: TrackTableViewCellDelegate?) {
        self.visibleTrack = visibleTrack
        self.index = index
        self.delegate = delegate
    }

    // MARK: - Outputs

    var positionText: ((String) -> Void)?

    var titleText: ((String) -> Void)?

    var albumTitleText: ((String) -> Void)?

    var playingState: ((AudioState) -> Void)?

    // MARK: - Inputs

    func didConfigure() {
        positionText?(visibleTrack.position.description)
        titleText?(visibleTrack.title)
        albumTitleText?(visibleTrack.albumTitle)
        playingState?(AudioState(isPlaying: visibleTrack.isPlaying))
    }

    func didPressPlayStop() {
        delegate?.trackTableViewCellDidPressPlayStop(at: index)
    }
}

extension TrackViewModel.AudioState {
    init(isPlaying: Bool) {
        self = isPlaying ? .stop : .play
    }
}
