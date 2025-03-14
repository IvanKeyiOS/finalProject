//
//  WheatherModel.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 02/03/2025.
//

import Foundation

// Главная структура для декодирования JSON
struct WeatherResponse: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let rain: Rain?
    let snow: Snow?
    let dt: Int?
    let sys: Sys?
    let timezone: Int?
    let id: Int?
    let name: String?
    let cod: Int?
}

// Координаты города
struct Coord: Codable {
    let lon: Double?
    let lat: Double?
}

// Основная информация о погоде
struct Weather: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

// Основные погодные параметры
struct Main: Codable {
    let temp: Double?
    let feelsLike: Double?
    let pressure: Int?
    let humidity: Int?
    let tempMin: Double?
    let tempMax: Double?
    let seaLevel: Int?
    let grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// Ветер
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

// Облачность
struct Clouds: Codable {
    let all: Int?
}

// Дождь
struct Rain: Codable {
    let oneHour: Double?

    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

// Снег
struct Snow: Codable {
    let oneHour: Double?

    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

// Дополнительные данные
struct Sys: Codable {
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}

