//
//  HourlyForecastCell.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 05/03/2025.
//

import SnapKit
import UIKit

class HourlyForecastCell: UICollectionViewCell {
    //MARK: - Properties
    private let timeLabel = UILabel()
    private var weatherIcon = UIImageView()
    private let temperatureLabel = UILabel()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(timeLabel)
        contentView.addSubview(weatherIcon)
        contentView.addSubview(temperatureLabel)
        
        timeLabel.textColor = .white
        weatherIcon.contentMode = .scaleAspectFit
        temperatureLabel.textColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        timeLabel.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
        }
        
        weatherIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.size.equalTo(30)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherIcon.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    
    //MARK: - Methods
    func configure(time: String ,temperature: String) {
        timeLabel.font = .systemFont(ofSize: 16)
        timeLabel.text = time
        if Int(time) ?? 0 < 10 {
            timeLabel.text = "0" + time
        }
        weatherIcon.image = .weatherIcon
        temperatureLabel.text = temperature
    }
}



