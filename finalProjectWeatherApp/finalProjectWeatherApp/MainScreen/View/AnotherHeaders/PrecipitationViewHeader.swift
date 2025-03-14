//
//  PrecipitationViewHeader.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 08/03/2025.
//

import UIKit
import SnapKit

class PrecipitationViewHeader: UIView {
    //MARK: - Properties
    private let umbrellaLabel = UIImageView()
    private let precipitationHeaderLabel = UILabel()
    
    //MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupUI() {
        umbrellaLabel.image = UIImage(systemName: "umbrella.fill")
        umbrellaLabel.tintColor = .weatherColorText
        umbrellaLabel.contentMode = .scaleAspectFit
        
        precipitationHeaderLabel.text = "PRECIPTIONAL"
        precipitationHeaderLabel.textColor = .weatherColorText
        precipitationHeaderLabel.font = .systemFont(ofSize: 14, weight: .medium)
        precipitationHeaderLabel.textAlignment = .left
        precipitationHeaderLabel.numberOfLines = 0
        precipitationHeaderLabel.lineBreakMode = .byWordWrapping
        
        addSubview(umbrellaLabel)
        addSubview(precipitationHeaderLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        umbrellaLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(16)
        }
        
        precipitationHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(umbrellaLabel.snp.leading).inset(25)
        }
        
        self.snp.makeConstraints { make in
            make.height.equalTo(15)
        }
    }
}



