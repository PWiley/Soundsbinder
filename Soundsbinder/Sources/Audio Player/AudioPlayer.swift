//
//  AudioPlayer.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 16/08/2022.
//  Copyright © 2022 Deutschekapital. All rights reserved.
////

import AVFoundation

public enum AudioPlayerError: Error {
    case cannotBuildValidPlayerWithData(data: Data)
}

enum PlayerState {
    case playing
    case downloading
    case stop
}

protocol AudioPlayerType: AnyObject {
    var delegate: AudioPlayerDelegate? { get set }
    var isPlaying: Bool { get }
    func startPlayingTrack(at url: URL)
    func stop()
}

protocol AudioPlayerDelegate: AnyObject {
    func playerDidFinishPlayingSound()
}

extension FileManager: FileManagerType {}

protocol FileManagerType {
    func fileExists(atPath path: String) -> Bool
    func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL]
    func moveItem(at srcURL: URL, to dstURL: URL) throws
}

final class AudioPlayer: NSObject, AudioPlayerType, AVAudioPlayerDelegate {

    // MARK: - Private properties

    private var player: AVAudioPlayer?

    private let repository: AudioPlayerRepositoryType

    private let fileManager: FileManagerType

    // MARK: - Public properties

    weak var delegate: AudioPlayerDelegate?

    // MARK: - Initializer

    init(repository: AudioPlayerRepositoryType, fileManager: FileManagerType = FileManager.default) {
        self.repository = repository
        self.fileManager = fileManager
        super.init()
    }

    // MARK: - Download sounds

    private func downloadPreviewSound(for url: URL,
                              success: @escaping () -> Void,
                              failure: @escaping () -> Void) {
        repository.downloadSound(at: url) { [weak self] location in
            guard let location = location, let destinationURL = self?.buildDestinationURL(with: url) else { return }
            do {
                try self?.fileManager.moveItem(at: location, to: destinationURL)
                success()
            } catch {
                failure()
            }
        }
    }

    private func buildDestinationURL(with url: URL) -> URL? {
        let musicDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        return musicDirectoryURL?.appendingPathComponent(url.lastPathComponent)
    }

    // MARK: - Player actions

    func startPlayingTrack(at url: URL) {
        player?.stop()

        guard let destinationURL = buildDestinationURL(with: url) else { return }

        if fileManager.fileExists(atPath: destinationURL.path) {
            player = try? AVAudioPlayer(contentsOf: destinationURL)
            play()
        } else {
            downloadPreviewSound(for: url, success: { [weak self] in
                self?.startPlayingTrack(at: url)
                }, failure: { [weak self] in
                    self?.player?.stop()
            })
        }
    }

    private func play() {
        player?.delegate = self
        player?.play()
    }

    func stop() {
        player?.stop()
    }

    deinit {
        player?.stop()
    }

    var isPlaying: Bool {
        return player?.isPlaying ?? false
    }

    // MARK: - Rate Observer

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        delegate?.playerDidFinishPlayingSound()
    }
}
