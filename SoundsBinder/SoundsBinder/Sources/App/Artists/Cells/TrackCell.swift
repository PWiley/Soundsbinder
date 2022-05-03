//
//  TrackCell.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.05.22.
//

import UIKit
import SnapKit

class TrackCell: UITableViewCell {
    
    private lazy var trackNumber: UILabel = {
        let number = UILabel()
        number.text = ""
        number.textColor = .white
        number.textAlignment = .center
        number.numberOfLines = 1
        return number
    }()
    
    private lazy var trackTitle: UILabel = {
        let title = UILabel()
        title.text = ""
        title.textColor = .white
        title.textAlignment = .center
        title.numberOfLines = 1
        return title
    }()
    
    private lazy var albumTitle: UILabel = {
        let albumTitle = UILabel()
        albumTitle.text = ""
        albumTitle.textColor = .white
        albumTitle.textAlignment = .center
        albumTitle.numberOfLines = 1
        return albumTitle
    }()
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.backgroundColor = .blue
        stackview.distribution = .fillProportionally
        stackview.axis = .vertical
        return stackview
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStackViewLayout()
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCellLayout()
    }

    func setStackViewLayout() {
        stackview.addSubview(trackTitle)
        trackTitle.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(15)
        }
        stackview.addSubview(albumTitle)
        albumTitle.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(15)
            
        }
    }
    func setupCellLayout() {
        contentView.addSubview(trackNumber)
        trackNumber.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.width.equalTo(10)
        }
        contentView.addSubview(stackview)
        stackview.snp.makeConstraints {
            $0.left.equalTo(trackNumber.rightAnchor as! ConstraintRelatableTarget)
            $0.right.top.bottom.equalToSuperview()
        }
        
    }
    
    // MARK: - Setup

    override func prepareForReuse() {
        super.prepareForReuse()
        self.trackNumber.text = "trackNumber"
        self.trackTitle.text = "trackTitle"
        self.albumTitle.text = "albumtitle"
    }

    func configure(album: Album) {
        self.trackNumber.text = album
        guard let imageURL = URL(string: artist.pictureURLString!) else {return}
        ImageProvider.shared.setImage(with: imageURL) { image in
            DispatchQueue.main.async {
                guard let image = image else {return}
                self.imageView.image = image
            }
        }
    }
}
