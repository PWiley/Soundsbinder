//
//  AlbumdetailsDataSource.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 05.05.22.
//

import UIKit

final class AlbumDetailsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var album: [Track] = [Track(trackNumber: 1,
                                trackTitle: "Till the end", albumTitle: "The album"),
                          Track(trackNumber: 2,
                                trackTitle: "Hey its my seconde song", albumTitle: "The album"),
                          Track(trackNumber: 3,
                                trackTitle: "White sister", albumTitle: "The album"),
                          Track(trackNumber: 4,
                                trackTitle: "Pamela", albumTitle: "The album")
    ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumDetailsCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AlbumDetailsCell
        albumDetailsCell.configure(track: album[indexPath.row])
        return albumDetailsCell
    }
    
    
}
