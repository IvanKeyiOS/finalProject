//
//  WindIndicatorView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 11/03/2025.
//

import SnapKit
import UIKit

class WindIndicatorView: UIView {
    
    private let windArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.up.circle.fill")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "5 m/s"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(windArrow)
        addSubview(windSpeedLabel)
        
        windArrow.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        windSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(windArrow.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    func updateDirection(angle: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.windArrow.transform = CGAffineTransform(rotationAngle: angle * .pi / 180)
        }
    }
}
