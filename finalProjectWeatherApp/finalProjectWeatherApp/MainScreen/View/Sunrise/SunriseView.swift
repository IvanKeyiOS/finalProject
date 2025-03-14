//
//  SunriseView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 09/03/2025.
//

import UIKit
import SnapKit

class SunriseView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "SUNRISE"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let sunriseTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunrise: 06:10"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let sunsetTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunset: 17:24"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 0.1
        progress.trackTintColor = UIColor.lightGray.withAlphaComponent(0.3)
        progress.progressTintColor = .yellow
        progress.layer.cornerRadius = 2
        progress.clipsToBounds = true
        return progress
    }()
    
    //MARK: - Properties
    private let sunLabel = UIImageView()
    
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
        self.backgroundColor = UIColor.weatherColorOne
        self.layer.cornerRadius = 12
        sunLabel.image = UIImage(systemName: "sunrise.fill")
        sunLabel.tintColor = .weatherColorText
        sunLabel.contentMode = .scaleAspectFit
        
        addSubview(sunLabel)
        addSubview(titleLabel)
        addSubview(sunriseTimeLabel)
        addSubview(progressView)
        addSubview(sunsetTimeLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        sunLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(sunLabel.snp.leading).offset(30)
        }
        
        sunriseTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(sunLabel.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(10)
            
        }
        
        progressView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(sunriseTimeLabel.snp.bottom).offset(39)
            make.height.equalTo(6)
        }
        
        sunsetTimeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
        }
    }
    
    func updateProgress(sunrise: String,
                        sunset: String,
                        progress: Float) {
        sunriseTimeLabel.text = sunrise
        sunsetTimeLabel.text = sunset
        progressView.progress = progress
    }
}
