//
//  UVIndexView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 10/03/2025.
//

import UIKit
import SnapKit

class UVIndexView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UV INDEX"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let uvValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let uvLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "Low"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Low levels all day."
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let indicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let indicatorProgressView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 3
        return view
    }()
    
    //MARK: - Properties
    private let gradientLayer = CAGradientLayer()
    private let indexUVLabel = UIImageView()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = indicatorBackgroundView.bounds
    }
    
    //MARK: - Private methods
    private func setupUI() {
        addSubview(indexUVLabel)
        addSubview(titleLabel)
        addSubview(uvValueLabel)
        addSubview(uvLevelLabel)
        addSubview(descriptionLabel)
        addSubview(indicatorBackgroundView)
        indicatorBackgroundView.layer.addSublayer(gradientLayer)
        indicatorBackgroundView.addSubview(indicatorProgressView)
        
        indexUVLabel.image = UIImage(systemName: "sun.max.fill")
        indexUVLabel.tintColor = .weatherColorText
        indexUVLabel.contentMode = .scaleAspectFit
        backgroundColor = .weatherColorOne
        layer.cornerRadius = 12
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        indexUVLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(indexUVLabel.snp.centerY)
            make.leading.equalTo(indexUVLabel.snp.leading).offset(30)
        }
        
        uvValueLabel.snp.makeConstraints { make in
            make.top.equalTo(indexUVLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        
        uvLevelLabel.snp.makeConstraints { make in
            make.top.equalTo(uvValueLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        
        indicatorBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(uvLevelLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(6)
        }
        
        indicatorProgressView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
        }
        setupGradient()
    }
    
    private func setupGradient() {
        gradientLayer.colors = getGradientColors(for: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 3
        gradientLayer.frame = indicatorBackgroundView.bounds
    }
    
    private func animateGradient(to newColors: [CGColor]) {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientLayer.colors
        animation.toValue = newColors
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        gradientLayer.colors = newColors
        gradientLayer.add(animation, forKey: "colorChange")
    }
    
    private func getGradientColors(for uvIndex: Int) -> [CGColor] {
        let colors: [CGColor] = [
            UIColor.green.cgColor,
            UIColor.yellow.cgColor,
            UIColor.orange.cgColor,
            UIColor.red.cgColor,
            UIColor.purple.cgColor
        ]
        
        let progress = CGFloat(uvIndex) / 11.0
        let index = min(colors.count - 1, max(0, Int(progress * CGFloat(colors.count - 1))))
        
        return [colors[index], colors[min(index + 1, colors.count - 1)]]
    }
    
    //MARK: - Methods
    func updateUVIndex(value: Int) {
        uvValueLabel.text = "\(value)"
        
        let widthMultiplier = CGFloat(value) / 11.0
        let barWidth = indicatorBackgroundView.frame.width * widthMultiplier
        
        UIView.animate(withDuration: 0.3) {
            self.indicatorProgressView.snp.updateConstraints { make in
                make.width.equalTo(barWidth)
            }
            self.layoutIfNeeded()
        }
        
        animateGradient(to: getGradientColors(for: value))
        
        switch value {
        case 0...2:
            uvLevelLabel.text = "Low"
            uvLevelLabel.textColor = .green
            indicatorProgressView.backgroundColor = .green
        case 3...5:
            uvLevelLabel.text = "Moderate"
            uvLevelLabel.textColor = .yellow
            indicatorProgressView.backgroundColor = .yellow
        case 6...7:
            uvLevelLabel.text = "High"
            uvLevelLabel.textColor = .orange
            indicatorProgressView.backgroundColor = .orange
        case 8...10:
            uvLevelLabel.text = "Very High"
            uvLevelLabel.textColor = .red
            indicatorProgressView.backgroundColor = .red
        default:
            uvLevelLabel.text = "Extreme"
            uvLevelLabel.textColor = .purple
            indicatorProgressView.backgroundColor = .purple
        }
    }
}




















