//
//  AlbumDataSource.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 05.05.22.
//

import UIKit

final class AlbumDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tracks: [Track] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
        //return album.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumDetailsCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AlbumDetailsCell
        //albumDetailsCell.configure(track: album[indexPath.row])
        return albumDetailsCell
    }
    func update(with tracks: [Track]) {
//        self.tracks = tracks.map {
//            VisibleTrack(track: $0)
//        }
    }
    
    
}
