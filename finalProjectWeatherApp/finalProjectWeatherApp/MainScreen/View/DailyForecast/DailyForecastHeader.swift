//
//  DailyForecastHeader.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 08/03/2025.
//

import SnapKit
import UIKit


class DailyForecastHeader: UIView {
    //MARK: - Properties
    private let calendarImage = UIImageView()
    private let dayLabel = UILabel()
    private let separatorView = UIView()
    
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
        calendarImage.image = UIImage(systemName: "calendar")
        calendarImage.tintColor = .weatherColorText
        calendarImage.contentMode = .scaleAspectFit
        dayLabel.text = "10-DAY FORECAST"
        
        dayLabel.font = .systemFont(ofSize: 14, weight: .bold)
        dayLabel.textColor = .weatherColorText
        dayLabel.numberOfLines = 0
        dayLabel.lineBreakMode = .byWordWrapping
        
        separatorView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        
        addSubview(calendarImage)
        addSubview(dayLabel)
        addSubview(separatorView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        calendarImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(16)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(calendarImage.snp.leading).inset(25)
        }
        
        separatorView.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
        
        self.snp.makeConstraints { make in
            make.height.equalTo(35)
        }
    }
}


