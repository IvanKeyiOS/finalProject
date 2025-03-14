//
//  SecondScreenViewController.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 02/03/2025.
//

import SnapKit
import UIKit

class SecondScreenViewController: UIViewController {
    //MARK: - GUI Variables
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "weatherBackground")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.clearButtonMode = .never
        searchBar.backgroundColor = .weatherColorTwo
        let placeholderText = "Search for a city"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray
        ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                                             attributes: attributes)
        if let glassIconView = searchBar.searchTextField.leftView as? UIImageView {
            glassIconView.tintColor = .lightGray
        }
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (view.frame.width - 15) 
        let hight = view.frame.height / 8
        layout.itemSize = CGSize(width: width, height: hight)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: view.frame.width,
                                                            height: view.frame.height - searchBar.frame.height),
                                                            collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        print("again3")
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        view.backgroundColor = .weatherColorTwo
        collectionView.backgroundColor = .clear
        collectionView.register(SecondScreenCollectionViewCell.self, forCellWithReuseIdentifier: "SecondScreenCollectionViewCell")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(10)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension SecondScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondScreenCollectionViewCell", for: indexPath) as? SecondScreenCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
//MARK: - UICollectionViewDelegate
extension SecondScreenViewController: UICollectionViewDelegate {
}
