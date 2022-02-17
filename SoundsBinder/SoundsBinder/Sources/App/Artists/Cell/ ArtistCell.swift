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
        image.contentMode = .scaleToFill
        //image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .semibold)
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
            //$0.height.equalToSuperview().dividedBy(<#T##amount: ConstraintMultiplierTarget##ConstraintMultiplierTarget#>)
        }
        
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.leftMargin.equalToSuperview()
            $0.rightMargin.equalToSuperview()
            $0.bottomMargin.equalToSuperview()
        }
//        let width = label.intrinsicContentSize.width // This reveal only text width in label
//        stackView.addSubview(label)
//            label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
//            label.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            label.centerYAnchor.constraint(equalTo: stackView.centerYAnchor, constant: 25).isActive = true
//            label.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
//
//        stackView.addSubview(imageView)
//        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
//        imageView.heightAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: label.topAnchor).isActive = true
//        imageView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true//
//
//        contentView.addSubview(stackView)
//        stackView.snp.makeConstraints {
//            $0.top.bottom.leading.trailing.equalToSuperview()
//        }
        
    }
    // MARK: - Setup
    
    func configure(with item: VisibleArtist) {
        label.text = item.name
        imageView.image =  UIImage(named: "Gainsbourg")
    }
    func shadowDecorate() {
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
        
    }}
