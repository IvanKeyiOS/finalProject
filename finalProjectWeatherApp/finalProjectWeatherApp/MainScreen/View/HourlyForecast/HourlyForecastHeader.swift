//
//  HourlyForecastHeader.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 08/03/2025.
//

import UIKit
import SnapKit

class HourlyForecastHeader: UIView {
    //MARK: - Properties
    private let clockImage = UIImageView()
    private let forecastHeader = UILabel()
    private let forecastHeaderDetails = UILabel()
    
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
        clockImage.image = UIImage(systemName: "clock")
        clockImage.tintColor = .weatherColorText
        clockImage.contentMode = .scaleAspectFit
        forecastHeader.text = "HOURLY FORECAST"
        forecastHeader.textColor = .weatherColorText
        forecastHeaderDetails.text = "Partly cloudy conditions expected around 00:00. Wind gust are up to 3 m/s."
        forecastHeaderDetails.textColor = .weatherColorText
        let labels = [forecastHeader,
                      forecastHeaderDetails]
        for label in labels {
            label.font = .systemFont(ofSize: 14, weight: .bold)
            
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
        }
        
        addSubview(clockImage)
        addSubview(forecastHeader)
        //        addSubview(forecastHeaderDetails)
        
        setupConstraints()
    }
    private func setupConstraints() {
        clockImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(16)
        }
        
        forecastHeader.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(clockImage.snp.leading).inset(25)
        }
        
        //        forecastHeaderDetails.snp.makeConstraints{ make in
        //            make.top.equalToSuperview().inset(10)
        //            make.leading.equalToSuperview().inset(10)
        //            make.trailing.equalToSuperview().inset(-10)
        //        }
        
        self.snp.makeConstraints { make in
            make.height.equalTo(15)
        }
    }
}


