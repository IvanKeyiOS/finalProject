//
//  InfoBoxView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 06/03/2025.
//


//MARK: - GUI Variables

//MARK: - Properties
//MARK: - Initialization
//MARK: - Life cycle

//MARK: - Private methods
//MARK: - Methods

private func setupConstraints() {}



import UIKit
import SnapKit

class InfoBoxView: UIView {
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let detailLabel = UILabel()
    
    init(title: String,
         subtitle: String,
         detail: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        subtitleLabel.text = subtitle
        detailLabel.text = detail
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        
        backgroundColor = .weatherColorOne
        layer.cornerRadius = 12
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .white
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = .white.withAlphaComponent(0.8)
        
        detailLabel.font = UIFont.systemFont(ofSize: 12)
        detailLabel.textColor = .white.withAlphaComponent(0.6)
        detailLabel.numberOfLines = 0
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(detailLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview().inset(10)
        }
    }
}
