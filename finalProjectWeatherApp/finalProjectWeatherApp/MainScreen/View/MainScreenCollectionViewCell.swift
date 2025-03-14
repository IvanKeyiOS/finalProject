//
//  MainScreenCollectionViewCell.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 03/03/2025.
//

import UIKit
import SnapKit

class MainScreenCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "MainScreenCollectionViewCell"
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Warsaw"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Mar 2, 08:39pm"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateLabel.frame = CGRect(x: 10, y: 10, width: frame.width - 20, height: 40)
        dateLabel.text = "this is a hat"
        addSubview(dateLabel)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        
        addSubview(cityNameLabel)
        
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        
        cityNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
        }
        
    }
}
    
    
  
