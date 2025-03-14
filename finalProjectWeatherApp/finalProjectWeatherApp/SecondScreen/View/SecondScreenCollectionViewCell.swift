//
//  SecondScreenCollectionViewCell.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 02/03/2025.
//

import SnapKit
import UIKit

final class SecondScreenCollectionViewCell: UICollectionViewCell {
    //MARK: - GUI Variables
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
//        view.image = UIImage(named: "image") ?? UIImage.add
        view.backgroundColor = .weatherColorOne
        return view
    }()

    

    private let cityNameLabel: UILabel = {
        let label = UILabel()

        label.text = "Warsaw"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)

        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()

        label.text = "20:07"
        label.textColor = .weatherColorText
        label.font = UIFont.systemFont(ofSize: 14)

        return label
    }()
    
    private let differentWeatherLabel: UILabel = {
        let label = UILabel()

        label.text = "Mostly Cloudy"
        label.textColor = .weatherColorText
        label.font = UIFont.systemFont(ofSize: 14)

        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "3°"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40)

        return label
    }()
    
    private let highestTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "H:3°"
        label.textColor = .weatherColorText
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let lowestTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "L:0°"
        label.textColor = .weatherColorText
        label.font = UIFont.systemFont(ofSize: 14)

        return label
    }()
    
    //MARK: - Properties
    let indentation = 10
    
    //MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private methods
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(cityNameLabel)
        addSubview(timeLabel)
        addSubview(differentWeatherLabel)
        addSubview(temperatureLabel)
        addSubview(highestTemperatureLabel)
        addSubview(lowestTemperatureLabel)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview()
        }
        
        cityNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(indentation)
            make.top.equalToSuperview().inset(indentation)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(cityNameLabel)
            make.top.equalTo(cityNameLabel.snp.bottom).offset(indentation)
        }
        
        differentWeatherLabel.snp.makeConstraints { make in
            make.leading.equalTo(cityNameLabel)
            make.bottom.equalToSuperview().inset(indentation)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(indentation)
        }
        
        lowestTemperatureLabel.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(indentation)
        }
        
        highestTemperatureLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(indentation)
            make.trailing.equalTo(lowestTemperatureLabel.snp.leading).inset(-indentation)
        }
    }
}
