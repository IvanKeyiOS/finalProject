//
//  PressureIndicatorView.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 11/03/2025.
//
//import SnapKit
//import UIKit
//
//class PressureIndicatorView: UIView {
//    
//    private let indicator: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 3
//        return view
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
//        backgroundColor = .clear
//        
//        addSubview(indicator)
//        
//        indicator.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview()
//            make.width.equalTo(6)
//            make.height.equalTo(20)
//        }
//    }
//    
//    func updateAngle(angle: CGFloat) {
//        self.transform = CGAffineTransform(rotationAngle: angle)
//    }
//}
//
import UIKit

class PressureIndicatorView: UIView {
    
    private let indicatorLayer = CAShapeLayer()
    private let scaleLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        createScale()
        createIndicator()
    }
    
    private func createScale() {
        let path = UIBezierPath()
        
        for i in 0...10 {
            let angle = CGFloat(i) * (CGFloat.pi / 10) - CGFloat.pi / 2
            let start = pointOnCircle(radius: 40, angle: angle)
            let end = pointOnCircle(radius: 50, angle: angle)
            path.move(to: start)
            path.addLine(to: end)
        }
        
        scaleLayer.path = path.cgPath
        scaleLayer.strokeColor = UIColor.lightGray.cgColor
        scaleLayer.lineWidth = 2
        scaleLayer.lineCap = .round
        layer.addSublayer(scaleLayer)
    }
    
    private func createIndicator() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY))
        path.addLine(to: pointOnCircle(radius: 40, angle: -CGFloat.pi / 2))
        
        indicatorLayer.path = path.cgPath
        indicatorLayer.strokeColor = UIColor.white.cgColor
        indicatorLayer.lineWidth = 3
        indicatorLayer.lineCap = .round
        layer.addSublayer(indicatorLayer)
    }
    
    func updateAngle(angle: CGFloat) {
        let newPath = UIBezierPath()
        newPath.move(to: CGPoint(x: bounds.midX, y: bounds.midY))
        newPath.addLine(to: pointOnCircle(radius: 40, angle: angle - CGFloat.pi / 2))
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = newPath.cgPath
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        indicatorLayer.add(animation, forKey: "path")
    }
    
    private func pointOnCircle(radius: CGFloat, angle: CGFloat) -> CGPoint {
        let x = bounds.midX + radius * cos(angle)
        let y = bounds.midY + radius * sin(angle)
        return CGPoint(x: x, y: y)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createScale()
        createIndicator()
    }
}
