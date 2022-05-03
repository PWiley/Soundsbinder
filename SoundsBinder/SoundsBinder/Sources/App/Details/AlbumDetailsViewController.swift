//
//  AlbumDetailsViewController.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.05.22.
//

import UIKit
import SnapKit

final class AlbumDetailsViewController: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TrackCell
        return cell
    }
    

    
    struct track {
        var trackNumber: Int
        var trackTitle: String
        var albumTitle: String
    }
    
    var album: [track] = [track(trackNumber: 1,
                                trackTitle: "Till the end",
                                albumTitle: "With a little help"),
                          track(trackNumber: 2,
                                trackTitle: "Hey its my seconde song",
                                albumTitle: "With a little help"),
                          track(trackNumber: 3,
                                trackTitle: "White sister",
                                albumTitle: "With a little help"),
                          track(trackNumber: 4,
                                trackTitle: "Pamela",
                                albumTitle: "With a little help")
    ]
    
    private lazy var albumTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = "Album Title"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .darkGray
        return tableView
    }()
}

