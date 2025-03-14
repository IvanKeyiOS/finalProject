//
//  AveragesView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 09/03/2025.
//

import UIKit
import SnapKit

class AveragesView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "AVERAGES"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "+10°"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Above average daily high"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let detailTodayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let detailAverageLabel: UILabel = {
        let label = UILabel()
        label.text = "Average"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let detailTemperatureTodayLabel: UILabel = {
        let label = UILabel()
        label.text = "H:15°"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let detailTemperatureAverageLabel: UILabel = {
        let label = UILabel()
        label.text = "H:5°"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    //MARK: - Properties
    private let averagesLabel = UIImageView()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupUI() {
        self.backgroundColor = .weatherColorOne
        self.layer.cornerRadius = 12
        averagesLabel.image = UIImage(systemName: "chart.line.uptrend.xyaxis")
        averagesLabel.tintColor = .weatherColorText
        averagesLabel.contentMode = .scaleAspectFit
        
        addSubview(averagesLabel)
        addSubview(titleLabel)
        addSubview(temperatureLabel)
        addSubview(subtitleLabel)
        addSubview(detailTodayLabel)
        addSubview(detailAverageLabel)
        addSubview(detailTemperatureTodayLabel)
        addSubview(detailTemperatureAverageLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        averagesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(averagesLabel.snp.leading).offset(25)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        detailTodayLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        
        detailAverageLabel.snp.makeConstraints { make in
            make.top.equalTo(detailTodayLabel.snp.bottom)
            make.leading.equalToSuperview().offset(10)
        }
        
        detailTemperatureTodayLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(detailTodayLabel.snp.leading).offset(95)
        }
        
        detailTemperatureAverageLabel.snp.makeConstraints { make in
            make.top.equalTo(detailTemperatureTodayLabel.snp.bottom)
            make.leading.equalTo(detailAverageLabel.snp.leading).offset(95)
        }
    }
    
    //MARK: - Methods
    func configure(title: String,
                   subtitle: String,
                   detailToday: String,
                   detailAverage: String,
                   temperatureToday: String,
                   temperatureAverage: String) {
        temperatureLabel.text = title
        subtitleLabel.text = subtitle
        detailTodayLabel.text = detailToday
        detailAverageLabel.text = detailToday
        detailTodayLabel.text = temperatureToday
        detailAverageLabel.text = temperatureAverage
        
    }
}
