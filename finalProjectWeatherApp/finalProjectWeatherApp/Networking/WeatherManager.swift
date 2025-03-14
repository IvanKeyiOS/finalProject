//
//  WeatherManager.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 12/03/2025.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(for city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}



class WeatherService: WeatherServiceProtocol {
    private let apiKey = "669c5bbf01599146037688c59b9ed414"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(for city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let urlString = "\(baseURL)?q=\(city)&units=metric&appid=\(apiKey)&lang=en"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(weatherData))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
