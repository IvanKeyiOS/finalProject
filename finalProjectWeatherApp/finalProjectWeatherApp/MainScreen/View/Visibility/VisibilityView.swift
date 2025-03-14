//
//  VisibilityView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 10/03/2025.
//


import UIKit
import SnapKit

class VisibilityView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "VISIBILITY"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()

    private let visibilityValueLabel: UILabel = {
        let label = UILabel()
        label.text = "26 km"
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.textColor = .white
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Perfectly clear view."
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    //MARK: - Properties
    private let visibilityLabel = UIImageView()

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
        visibilityLabel.image = UIImage(systemName: "eye.fill")
        visibilityLabel.tintColor = .weatherColorText
        visibilityLabel.contentMode = .scaleAspectFit

        addSubview(visibilityLabel)
        addSubview(titleLabel)
        addSubview(visibilityValueLabel)
        addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        visibilityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(visibilityLabel.snp.leading).offset(35)
        }

        visibilityValueLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-15)
        }
    }
}
