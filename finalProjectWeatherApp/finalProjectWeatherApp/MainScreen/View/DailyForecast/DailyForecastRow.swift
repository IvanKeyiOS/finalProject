//
//  DailyForecastRow.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 05/03/2025.
//

import SnapKit
import UIKit

class DailyForecastRow: UIView {
    //MARK: - Properties
    private let dayLabel = UILabel()
    private var weatherIcon = UIImageView()
    private let minTempLabel = UILabel()
    private let maxTempLabel = UILabel()
    private let separatorView = UIView()
    private var stack = UIStackView()
    
    //MARK: - Initialization
    init(day: String,
         iconName: String,
         minTemp: String,
         maxTemp: String,
         isLast: Bool) {
        super.init(frame: .zero)
        
        setupUI(day: day,
                iconName: iconName,
                minTemp: minTemp,
                maxTemp: maxTemp,
                isLast: isLast)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupUI(day: String,
                         iconName: String,
                         minTemp: String,
                         maxTemp: String,
                         isLast: Bool) {
        dayLabel.text = day
        dayLabel.font = .systemFont(ofSize: 16)
        dayLabel.textColor = .white
        
        weatherIcon.image = .weatherIcon
        weatherIcon.contentMode = .scaleAspectFill
        
        minTempLabel.text = minTemp
        minTempLabel.font = .systemFont(ofSize: 16)
        minTempLabel.textColor = .white
        
        maxTempLabel.text = maxTemp
        maxTempLabel.font = .systemFont(ofSize: 16)
        maxTempLabel.textColor = .white
        
        stack = UIStackView(arrangedSubviews: [dayLabel,
                                               weatherIcon,
                                               minTempLabel,
                                               maxTempLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        addSubview(stack)
        addSubview(separatorView)
        
        
        if !isLast {
            separatorView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        weatherIcon.snp.makeConstraints { make in
            make.size.equalTo(30)
        }
        
        separatorView.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
    }
}

