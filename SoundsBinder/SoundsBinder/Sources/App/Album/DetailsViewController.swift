//
//  DetailsViewController.swift
//  Details
//
//  Created by Patrick Wiley on 22.02.22.
//

import UIKit
import SnapKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Proporties
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.textAlignment = .center
        label.text = "Artist name"
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Avatar")
        return image
    }()
    
    private var viewModel: DetailsViewModel!
    
    // MARK: - Initialisers
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        bind(to: viewModel)
    }
    
    // MARK: - Functions
    
    func bind(to viewModel: DetailsViewModel) {
        name.text = viewModel.artist?.name
        
//        if let image = UIImage(data: viewModel.artist!.pictureURLString) {
//            print(image)
//        }
        
    }
   
    // MARK: - Functions helper contraints
    
    func setUpLayout() {
        view.addSubview(image)
        image.snp.makeConstraints {
            $0.height.equalTo(350)
            $0.leading.equalTo(view.snp.leading).inset(40)
            $0.trailing.equalTo(view.snp.trailing).inset(40)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            }
        view.addSubview(name)
        name.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.equalTo(view.snp.leading).inset(40)
            $0.trailing.equalTo(view.snp.trailing).inset(40)
            $0.top.equalTo(image.snp.bottom)
            }
    }
}
