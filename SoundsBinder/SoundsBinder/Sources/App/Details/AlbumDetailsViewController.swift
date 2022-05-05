//
//  AlbumDetailsViewController.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 03.05.22.
//

import UIKit
import SnapKit

final class AlbumDetailsViewController: UIViewController {
    
    private lazy var source: AlbumDetailsDataSource = {
        let source = AlbumDetailsDataSource()
        return source
    }()
   
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
        tableView.register(AlbumDetailsCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    // MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = source
        tableView.delegate = source
        setupLayout()
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       
    }
    
    func setupLayout() {
       
        view.addSubview(albumTitle)
        albumTitle.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(20)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view).inset(16)
            $0.top.equalTo(albumTitle.snp.bottom)
        }
        
    }
}

