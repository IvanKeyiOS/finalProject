//
//  HumidityView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 11/03/2025.
//

//import UIKit
//import SnapKit
//
//class HumidityView: UIView {
//    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "HUMIDITY"
//        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//        label.textColor = .lightGray
//        return label
//    }()
//    
//    private let humidityLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
//        label.textColor = .white
//        return label
//    }()
//    
//    private let descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.textColor = .lightGray
//        label.numberOfLines = 2
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupUI() {
//        backgroundColor = UIColor.black.withAlphaComponent(0.3)
//        layer.cornerRadius = 12
//        
//        addSubview(titleLabel)
//        addSubview(humidityLabel)
//        addSubview(descriptionLabel)
//        
//        titleLabel.snp.makeConstraints { make in
//            make.top.left.equalToSuperview().offset(15)
//        }
//        
//        humidityLabel.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(15)
//        }
//        
//        descriptionLabel.snp.makeConstraints { make in
//            make.top.equalTo(humidityLabel.snp.bottom).offset(5)
//            make.left.equalToSuperview().offset(15)
//            make.right.equalToSuperview().offset(-15)
//        }
//    }
//    
//    func configure(humidity: Int, dewPoint: Int) {
//        humidityLabel.text = "\(humidity)%"
//        descriptionLabel.text = "The dew point is \(dewPoint)° right now."
//    }
//}



import UIKit
import SnapKit

class HumidityView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "HUMIDITY"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let humidityValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let unitLabel: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: - Properties
    private let humidityLabel = UIImageView()
    
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
        humidityLabel.image = UIImage(systemName: "humidity.fill")
        humidityLabel.tintColor = .weatherColorText
        humidityLabel.contentMode = .scaleAspectFit
        
        addSubview(humidityLabel)
        addSubview(titleLabel)
        addSubview(humidityValueLabel)
        addSubview(unitLabel)
        addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        humidityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(humidityLabel.snp.leading).offset(30)
        }
        
        humidityValueLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        unitLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(humidityValueLabel.snp.trailing).offset(5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
//            make.top.equalTo(humidityValueLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func configure(humidity: Int, dewPoint: Int) {
        humidityValueLabel.text = "\(humidity)"
        descriptionLabel.text = "The dew point is \(dewPoint)° right now."
    }
}
