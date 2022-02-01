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
    
    private lazy var button: UIButton = {
        var button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        // Adding Generic custom cell
        return tableView
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
    
    private let viewModel: ArtistsViewModel
    
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
        bindViewModel()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        bindViewModel()
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
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(70)
        }
        stackView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchStackView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
            
        }
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        viewModel.items = { [weak self] items in
            DispatchQueue.main.async {
                self?.items = items
                self?.tableView.reloadData()
            }
        }
    }
    // MARK: - Actions
    
    @objc func buttonAction(sender: UIButton!) {
        guard let name = textField.text else { return }
        viewModel.didPressSearch(for: name)
    }
}

extension ArtistsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = self.items[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = element.name
        return cell
    }
    
    
}


