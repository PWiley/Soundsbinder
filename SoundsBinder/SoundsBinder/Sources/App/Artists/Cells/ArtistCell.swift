//
//   ArtistCell.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.02.22.
//

import UIKit
import SnapKit

final class ArtistCell: UICollectionViewCell {
    
    // MARK: - Private Properties
    
    private var viewModel: ArtistCellViewModel?
    
    private lazy var imageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Avatar")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .fillProportionally
//        stackView.axis = .vertical
//        return stackView
//    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCellLayout()
    }
    
    // MARK: - Functions helper contraints
    
    
    private func setupCellLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.height.topMargin.leftMargin.rightMargin.equalToSuperview()
        }
        
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.leftMargin.equalToSuperview()
            $0.rightMargin.equalToSuperview()
            $0.bottomMargin.equalToSuperview()
        }
    }
    // MARK: - Setup

    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = UIImage(named: "Avatar")
    }

    func configure(artist: VisibleArtist) {
        self.label.text = artist.name
        guard let imageURL = URL(string: artist.pictureURLString!) else {return}
        ImageProvider.shared.setImage(with: imageURL) { image in
            DispatchQueue.main.async {
                guard let image = image else {return}
                self.imageView.image = image
            }
        }
    }
}
