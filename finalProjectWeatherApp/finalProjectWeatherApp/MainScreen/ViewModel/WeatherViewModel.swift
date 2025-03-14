//
//  WeatherViewModel.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 02/03/2025.
//

import Foundation

protocol WeatherViewModelProtocol {
    var cityName: String { get }
    var temperature: String { get }
    var weatherDescription: String { get }
    var humidity: String { get }
    var windSpeed: String { get }
    var iconURL: URL? { get }
    
    func fetchWeather(for city: String, completion: @escaping (Result<Void, Error>) -> Void)
}



class WeatherViewModel: WeatherViewModelProtocol {
    private let weatherService: WeatherServiceProtocol
    private var weatherData: WeatherResponse?
    
    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }
    
    var cityName: String {
        return weatherData?.name ?? "Unknown"
    }
    
    var temperature: String {
        guard let temp = weatherData?.main?.temp else { return "--°C" }
        return "\(Int(temp))°C"
    }
    
    var weatherDescription: String {
        return weatherData?.weather?.first?.description?.capitalized ?? "No data"
    }
    
    var humidity: String {
        guard let humidity = weatherData?.main?.humidity else { return "--%" }
        return "\(humidity)%"
    }
    
    var windSpeed: String {
        guard let speed = weatherData?.wind?.speed else { return "-- m/s" }
        return "\(speed) m/s"
    }
    
    var iconURL: URL? {
        guard let icon = weatherData?.weather?.first?.icon else { return nil }
        return URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
    
    func fetchWeather(for city: String, completion: @escaping (Result<Void, Error>) -> Void) {
        weatherService.fetchWeather(for: city) { [weak self] result in
            switch result {
            case .success(let data):
                self?.weatherData = data
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
