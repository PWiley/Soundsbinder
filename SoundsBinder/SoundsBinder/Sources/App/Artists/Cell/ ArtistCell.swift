//
//   ArtistCell.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.02.22.
//

import UIKit


final class ArtistCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var imageView: UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
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
    
    //private func setupCellLayout() {
    //
    //    contentView.addSubview(stackView)
    //    stackView.addSubview(imageView)
    //    imageView.snp.makeConstraints {
    //        $0.width.equalTo(40)
    //        $0.height.equalTo(40)
    //        $0.leading.equalToSuperview()
    //        $0.top.equalToSuperview()
    //        //$0.leading.equalToSuperview()
    //        // $0.top.leading.trailing.bottom.equalToSuperview()
    //    }
    //
    //    stackView.addSubview(label)
    //    label.snp.makeConstraints {
    //        $0.width.equalTo(40)
    //        $0.height.equalTo(25)
    //        $0.leading.equalToSuperview()
    //        $0.bottom.equalToSuperview()
    //        //$0.leading.equalToSuperview()
    //        //$0.top.leading.trailing.bottom.equalToSuperview()
    //    }
    //
    //}
    
    private func setupCellLayout() {
        
        stackView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(60)
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        stackView.addSubview(label)
        label.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(20)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(60)
            $0.centerX.equalTo(contentView.center.x)
            $0.centerY.equalTo(contentView.center.y)

        }
    }
    // MARK: - Setup
    
    func configure(with item: VisibleArtist) {
        label.text = item.name
        imageView.image =  UIImage(named: "Gainsbourg")
    }
    
}
