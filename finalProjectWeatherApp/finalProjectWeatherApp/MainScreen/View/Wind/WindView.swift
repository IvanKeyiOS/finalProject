//
//  WindView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 06/03/2025.
//



//MARK: - Life cycle

//MARK: - Private methods

import UIKit
import SnapKit

class WindView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "WIND"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let windLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let speedLabel: UILabel = {
        let label = UILabel()
        label.text = "5 m/s"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let gustsLabel: UILabel = {
        let label = UILabel()
        label.text = "Gusts"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let gustsSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "10 m/s"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let directionLabel: UILabel = {
        let label = UILabel()
        label.text = "Direction"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let directionDegreesLabel: UILabel = {
        let label = UILabel()
        label.text = "267° W"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let windIndicatorView: WindIndicatorView = {
        let view = WindIndicatorView()
        return view
    }()
    
    //MARK: - Properties
    private let separator1 = UIView()
    private let separator2 = UIView()
    private let windImageLabel = UIImageView()
    
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
        separator1.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        separator2.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        windImageLabel.image = UIImage(systemName: "wind")
        windImageLabel.tintColor = .weatherColorText
        windImageLabel.contentMode = .scaleAspectFit
        
        
        addSubview(windImageLabel)
        addSubview(titleLabel)
        addSubview(windLabel)
        addSubview(speedLabel)
        addSubview(gustsLabel)
        addSubview(gustsSpeedLabel)
        addSubview(directionLabel)
        addSubview(directionDegreesLabel)
        addSubview(windIndicatorView)
        addSubview(separator1)
        addSubview(separator2)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        windImageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(35)
        }
        
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        speedLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.trailing.equalTo(windIndicatorView.snp.leading).offset(-15)
        }
        
        
        separator1.snp.makeConstraints { make in
            make.top.equalTo(windLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(windIndicatorView.snp.leading).offset(-15)
            make.height.equalTo(1)
        }
        
        gustsLabel.snp.makeConstraints { make in
            make.top.equalTo(separator1.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        gustsSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(separator1.snp.bottom).offset(10)
            make.trailing.equalTo(windIndicatorView.snp.leading).offset(-15)
        }
        
        separator2.snp.makeConstraints { make in
            make.top.equalTo(gustsLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(windIndicatorView.snp.leading).offset(-15)
            make.height.equalTo(1)
        }
        
        directionLabel.snp.makeConstraints { make in
            make.top.equalTo(separator2.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        directionDegreesLabel.snp.makeConstraints { make in
            make.top.equalTo(separator2.snp.bottom).offset(10)
            make.trailing.equalTo(windIndicatorView.snp.leading).offset(-15)
        }
        
        windIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(80)
        }
    }
    
    //MARK: - Methods
    func configure(windSpeed: Int, gusts: Int, direction: Int) {
        speedLabel.text = "\(windSpeed) m/s"
        gustsSpeedLabel.text = "\(gusts) m/s"
        directionDegreesLabel.text = "\(direction)° W"
        
        windIndicatorView.updateDirection(angle: CGFloat(direction))
    }
}
