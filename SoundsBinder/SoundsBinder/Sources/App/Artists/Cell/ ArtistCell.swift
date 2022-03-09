//
//   ArtistCell.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.02.22.
//

import UIKit


final class ArtistCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private var repository: ImageRepository?
    
    private lazy var imageView: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleToFill
        //image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        // label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        // label.font = .systemFont(ofSize: 15, weight: .semibold)
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        return stackView
    }()
    
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
    
    func configure(with item: VisibleArtist) {
        
        label.text = item.name
        imageView.image =  UIImage(named: "Avatar")
        repository = ImageRepository()
        
        if let imageUrl = item.pictureURLString {
            repository?.downloadImage(for: URL(string: imageUrl)!, cancelledBy: RequestCancellationToken(), callback: { [weak self] data in
                DispatchQueue.main.async {
                    guard let data = data else { return }
                    self?.imageView.image = UIImage(data: data)
                }
            })
        }
    }
    
}
