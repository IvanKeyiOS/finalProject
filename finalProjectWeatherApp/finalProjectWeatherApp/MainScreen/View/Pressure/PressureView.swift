import UIKit
import SnapKit

class PressureView: UIView {
    //MARK: - GUI Variables
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PRESSURE"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let pressureValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let unitLabel: UILabel = {
        let label = UILabel()
        label.text = "hPa"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Low"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let highLabel: UILabel = {
        let label = UILabel()
        label.text = "High"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let lowValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let highValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let pressureIndicator: PressureIndicatorView = {
        let view = PressureIndicatorView()
        return view
    }()
    
    //MARK: - Properties
    private let pressureLabel = UIImageView()
    
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
        pressureLabel.image = UIImage(systemName: "gauge.with.dots.needle.bottom.50percent")
        pressureLabel.tintColor = .weatherColorText
        pressureLabel.contentMode = .scaleAspectFit
        
        addSubview(pressureLabel)
        addSubview(titleLabel)
        addSubview(pressureIndicator)
        addSubview(pressureValueLabel)
        addSubview(unitLabel)
        addSubview(lowLabel)
        addSubview(highLabel)
        addSubview(lowValueLabel)
        addSubview(highValueLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        pressureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(pressureLabel.snp.leading).offset(30)
        }
        
        pressureIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        pressureValueLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        unitLabel.snp.makeConstraints { make in
            make.top.equalTo(pressureValueLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
        }
        
        lowLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        highLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        lowValueLabel.snp.makeConstraints { make in
            make.left.equalTo(lowLabel.snp.right).offset(5)
            make.centerY.equalTo(lowLabel)
        }
        
        highValueLabel.snp.makeConstraints { make in
            make.right.equalTo(highLabel.snp.left).offset(-5)
            make.centerY.equalTo(highLabel)
        }
    }
    
    func configure(pressure: Int, low: Int, high: Int, angle: CGFloat) {
        pressureValueLabel.text = "\(pressure)"
        lowValueLabel.text = "\(low)"
        highValueLabel.text = "\(high)"
        pressureIndicator.updateAngle(angle: angle)
    }
}
