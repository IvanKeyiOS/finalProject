//
//  FeelsLikeView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 09/03/2025.
//

import UIKit
import SnapKit

class FeelsLikeView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "FEELS LIKE"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let feelsLikeTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "4°"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Actual: 9°"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind is making it feel colder."
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let indicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3
        return view
    }()
    
    //MARK: - Properties
    private let feelsLabel = UIImageView()
    private var barWidth: CGFloat = 0.0
    private var tempDifference: Int = 0
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        configure(actualTemp: 9, feelsLikeTemp: 4, detail: "Wind is making it feel colder.")
    }
    
    //MARK: - Private methods
    private func setupUI() {
        self.backgroundColor = .weatherColorOne
        self.layer.cornerRadius = 12
        feelsLabel.image = UIImage(systemName: "thermometer.medium")
        feelsLabel.tintColor = .weatherColorText
        feelsLabel.contentMode = .scaleAspectFit
        
        addSubview(feelsLabel)
        addSubview(titleLabel)
        addSubview(feelsLikeTemperatureLabel)
        addSubview(subtitleLabel)
        addSubview(detailLabel)
        addSubview(indicatorBackgroundView)
        indicatorBackgroundView.addSubview(indicatorView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        feelsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(feelsLabel.snp.leading).offset(25)
        }
        
        feelsLikeTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(feelsLikeTemperatureLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        
        indicatorBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(6)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.left.centerY.equalToSuperview()
            make.width.equalTo(0)
            make.height.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(indicatorBackgroundView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-40)
        }
    }
    
    func configure(actualTemp: Int, feelsLikeTemp: Int, detail: String) {
        feelsLikeTemperatureLabel.text = "\(feelsLikeTemp)°"
        subtitleLabel.text = "Actual: \(actualTemp)°"
        detailLabel.text = detail
        
        let tempDifference = actualTemp - feelsLikeTemp
        let progress = CGFloat(abs(tempDifference)) / 10.0
        barWidth = min(progress, 1.0) * (self.frame.width - 20)
        
        indicatorView.snp.updateConstraints { make in
            make.width.equalTo(barWidth)
        }
        
        if tempDifference > 0 {
            indicatorView.backgroundColor = .cyan
        } else {
            indicatorView.backgroundColor = .orange
        }
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}

