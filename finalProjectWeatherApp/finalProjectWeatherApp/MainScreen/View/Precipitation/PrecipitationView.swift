//
//  PrecipitationView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 10/03/2025.
//

import UIKit
import SnapKit

class PrecipitationView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PRECIPITATION"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let precipitationValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0 mm"
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let forecastLabel: UILabel = {
        let label = UILabel()
        label.text = "Next expected is 2 mm on Wed."
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    //MARK: - Properties
    private let precipitationLabel = UIImageView()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Private methods
    private func setupUI() {
        self.backgroundColor = .weatherColorOne
        self.layer.cornerRadius = 12
        precipitationLabel.image = UIImage(systemName: "drop.fill")
        precipitationLabel.tintColor = .weatherColorText
        precipitationLabel.contentMode = .scaleAspectFit
        
        
        addSubview(precipitationLabel)
        addSubview(titleLabel)
        addSubview(precipitationValueLabel)
        addSubview(forecastLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        precipitationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(precipitationLabel.snp.leading).offset(25)
        }
        
        precipitationValueLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        forecastLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-40)
        }
    }
}
