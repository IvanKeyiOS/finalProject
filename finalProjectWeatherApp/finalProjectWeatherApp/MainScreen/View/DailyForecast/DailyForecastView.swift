//
//  DailyForecastView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 06/03/2025.
//

import SnapKit
import UIKit

class DailyForecastView: UIView {
    //MARK: - Properties
    private let stackView = UIStackView()
    private let dailyData: [(String, String, String, String)] = [
        ("Mon", "weatherIcon", "3°", "11°"),
        ("Tue", "weatherIcon", "3°", "11°"),
        ("Wed", "weatherIcon", "2°", "13°"),
        ("Thu", "weatherIcon", "4°", "15°"),
        ("Fri", "weatherIcon", "3°", "11°"),
        ("Sat", "weatherIcon", "3°", "11°"),
        ("Sun", "weatherIcon", "3°", "11°"),
        ("Mon", "weatherIcon", "3°", "11°")
    ]
    
    private let header = DailyForecastHeader()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupView() {
        stackView.layer.cornerRadius = 12
        stackView.backgroundColor = .weatherColorOne
        stackView.axis = .vertical
        stackView.alignment = .fill
        
        addSubview(stackView)
        stackView.addArrangedSubview(header)
        
        setupDailyData()
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func setupDailyData() {
        for (index, element) in dailyData.enumerated() {
            let isLast = index == dailyData.count - 1
            let row = DailyForecastRow(day: element.0, iconName: element.1, minTemp: element.2, maxTemp: element.3, isLast: isLast)
            stackView.addArrangedSubview(row)
        }
    }
}

