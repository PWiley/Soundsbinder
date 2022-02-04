//
//  ArtistsViewController.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 02/12/2021.
//

import UIKit
import SnapKit

final class ArtistsViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel:  ArtistsViewModel!
    
    private lazy var source = ArtistsDataSource(collectionView: collectionView,
                                                viewModel: viewModel)
    
    private lazy var button: UIButton = {
        var button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(searchArtist), for: .touchUpInside)
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .red
        return textField
    }()
    
    private lazy var searchStackView: UIStackView = {
        var searchStackView = UIStackView()
        searchStackView.distribution = .equalSpacing
        searchStackView.alignment = .fill
        searchStackView.axis = .horizontal
        searchStackView.spacing = 10
        return searchStackView
    }()
        
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 40, height: 40)
        let collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
        collectionView.register(ArtistCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.backgroundColor = .blue
        stackView.spacing = 10
        
        return stackView
    }()
    
    
    private var items: [Artist] = []
    
    // MARK: - Init
    
    init(viewModel: ArtistsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        bind(to: viewModel)
        viewModel.viewWillAppear()
    }
    
    // MARK: - Private
    
    private func setupLayout() {
        searchStackView.addSubview(button)
        button.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(-20)
            $0.top.equalToSuperview().inset(-10)
            $0.bottom.equalToSuperview().inset(-10)
            $0.width.equalTo(80)
        }
        searchStackView.addSubview(textField)
        textField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.leading.equalTo(button.snp.trailing)
        }
        stackView.addSubview(searchStackView)
        searchStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(-20)
            $0.height.equalTo(70)
        }
        stackView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchStackView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func bind(to viewModel: ArtistsViewModel) {
        viewModel.items = { [weak self] items in
            DispatchQueue.main.async {
                self?.source.update(with: items)
                self?.collectionView.reloadData()
            }
        }
    }

    // MARK: - Actions
    
    @objc func searchArtist(sender: UIButton!) {
        guard let name = textField.text else { return }
        viewModel.didPressSearch(for: name)
    }
}


