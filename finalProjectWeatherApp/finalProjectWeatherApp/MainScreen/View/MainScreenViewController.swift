//
//  MainScreenViewController.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 02/03/2025.
//

import UIKit
import SnapKit

class MainScreenViewController: UIViewController {
    //MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()

        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .weatherColorTwo

        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Mar 4, 05:32am"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Warsaw, PL"
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "5°"
        label.font = UIFont.systemFont(ofSize: 71, weight: .thin)
        label.textColor = .white
        return label
    }()
    
    private let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mostly Clear"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .weatherColorText
        return label
    }()
    
    private let highestTemperature: UILabel = {
        let label = UILabel()
        label.text = "H:17°"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let lowestTemperature: UILabel = {
        let label = UILabel()
        label.text = "L:0°"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let hourlyView: UIView = {
        let view = UIView()
        view.backgroundColor = .weatherColorOne
        return view
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
    }()
    
    private let hourlyForecastCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HourlyForecastCell.self, forCellWithReuseIdentifier: "HourlyForecastCell")
        return collectionView
    }()
    
    private let forPrecipitationMapView: UIView = {
        let view = UIView()
        view.backgroundColor = .weatherColorOne
        view.layer.cornerRadius = 12
        return view
    }()

    private let precipitationMapView: UIView = {
        let view = UIView()
        view.backgroundColor = .weatherColorTwo
        view.layer.cornerRadius = 12
        return view
    }()

    private let hourlyForecastHeader = HourlyForecastHeader()
    private let dailyForecastView = DailyForecastView()
    private let precipitationViewHeader = PrecipitationViewHeader()
    private let averagesView = AveragesView()
    private let feelLike = FeelsLikeView()
    private let sunriseView = SunriseView()
    private let contentView = UIView()
    private let indexUVView = UVIndexView()
    private let windView = WindView()
    private let precipitationView = PrecipitationView()
    private let visibilityView = VisibilityView()
    private let pressureView = PressureView()
    private let humidityView = HumidityView()
    private var viewModel: WeatherViewModelProtocol = WeatherViewModel(weatherService: WeatherService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        indexUVView.updateUVIndex(value: 0)
        humidityView.configure(humidity: 66, dewPoint: -1)
        pressureView.configure(pressure: 1022, low: 870, high: 1013, angle: 0.9)
        
        fetchWeatherData()
    }
    
    private func fetchWeatherData() {
        viewModel.fetchWeather(for: "Paris") { [weak self] result in
            switch result {
            case .success():
                self?.updateUI()
            case .failure(let error):
                print("Error fetching weather: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateUI() {
        temperatureLabel.text = viewModel.temperature
//        dateLabel.text = viewModel.
    }
    private func setupUI() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(weatherDescriptionLabel)
        contentView.addSubview(highestTemperature)
        contentView.addSubview(lowestTemperature)
        contentView.addSubview(hourlyView)
        contentView.addSubview(hourlyForecastHeader)
        contentView.addSubview(separatorView)
        contentView.addSubview(hourlyForecastCollectionView)
        contentView.addSubview(dailyForecastView)
        contentView.addSubview(forPrecipitationMapView)
        contentView.addSubview(precipitationViewHeader)
        contentView.addSubview(precipitationMapView)
        contentView.addSubview(averagesView)
        contentView.addSubview(feelLike)
        contentView.addSubview(windView)
        contentView.addSubview(indexUVView)
        contentView.addSubview(sunriseView)
        contentView.addSubview(precipitationView)
        contentView.addSubview(visibilityView)
        contentView.addSubview(pressureView)
        contentView.addSubview(humidityView)

        
        setupConstraints()
        setupHourlyForecast()
        setupTabBarNavigationBarColor()
    }
    
    private func setupHourlyForecast() {
        hourlyForecastCollectionView.delegate = self
        hourlyForecastCollectionView.dataSource = self
        hourlyView.layer.cornerRadius = 12
        hourlyView.backgroundColor = .weatherColorOne
    }
    private func setupTabBarNavigationBarColor() {
        tabBarController?.tabBar.tintColor = .white
        tabBarController?.tabBar.unselectedItemTintColor = .red
        
        if let navigationBar = navigationController?.navigationBar {
               let appearance = UINavigationBarAppearance()
               appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .weatherColorTwo
               navigationBar.standardAppearance = appearance
               navigationBar.scrollEdgeAppearance = appearance
           }

           if let tabBar = tabBarController?.tabBar {
               let appearance = UITabBarAppearance()
               appearance.configureWithOpaqueBackground()
               appearance.backgroundColor = .weatherColorTwo
               tabBar.standardAppearance = appearance
               tabBar.scrollEdgeAppearance = appearance
           }
    }
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.edges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        highestTemperature.snp.makeConstraints { make in
            make.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview().offset(-20)
        }
        
        lowestTemperature.snp.makeConstraints { make in
            make.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview().offset(20)
        }
        
        hourlyView.snp.makeConstraints { make in
            make.top.equalTo(lowestTemperature.snp.bottom).offset(70)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(145)
        }
        
        hourlyForecastHeader.snp.makeConstraints { make in
            make.top.equalTo(hourlyView.snp.top).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }

        separatorView.snp.makeConstraints { make in
            make.top.equalTo(hourlyForecastHeader.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(1)
        }
        
        hourlyForecastCollectionView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(120)
        }
        
        dailyForecastView.snp.makeConstraints { make in
            make.top.equalTo(hourlyView.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        forPrecipitationMapView.snp.makeConstraints { make in
            make.top.equalTo(dailyForecastView.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(360)
        }
        
        precipitationViewHeader.snp.makeConstraints { make in
            make.top.equalTo(forPrecipitationMapView.snp.top).offset(7)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        precipitationMapView.snp.makeConstraints { make in
            make.top.equalTo(precipitationViewHeader.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(320)
        }
        
        
        averagesView.snp.makeConstraints { make in
            make.top.equalTo(forPrecipitationMapView.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.44)
            make.height.equalTo(170)
        }
        
        feelLike.snp.makeConstraints { make in
            make.top.equalTo(forPrecipitationMapView.snp.bottom).offset(7)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().multipliedBy(0.44)
            make.height.equalTo(170)
        }
        
        windView.snp.makeConstraints { make in
            make.top.equalTo(averagesView.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(170)
        }
        
        indexUVView.snp.makeConstraints { make in
            make.top.equalTo(windView.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.44)
            make.height.equalTo(170)
        }
        
        sunriseView.snp.makeConstraints { make in
            make.top.equalTo(windView.snp.bottom).offset(7)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().multipliedBy(0.44)
            make.height.equalTo(170)
        }
        
        precipitationView.snp.makeConstraints { make in
            make.top.equalTo(indexUVView.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.44)
            make.height.equalTo(170)
        }
        
        visibilityView.snp.makeConstraints { make in
            make.top.equalTo(sunriseView.snp.bottom).offset(7)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().multipliedBy(0.44)
            make.height.equalTo(170)
            
        }
        
        humidityView.snp.makeConstraints { make in
            make.top.equalTo(precipitationView.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.44)
            make.height.equalTo(170)
            
        }
        
        pressureView.snp.makeConstraints { make in
            make.top.equalTo(visibilityView.snp.bottom).offset(7)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().multipliedBy(0.44)
            make.height.equalTo(170)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyForecastCell", for: indexPath) as! HourlyForecastCell
        cell.configure(time: "\(indexPath.item  + 0)", temperature: "\(5 - indexPath.item)°")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 100)
    }
}
