//
//  Weather.swift
//  WeatherSwiftUi
//
//  Created by Vitor Henrique Barreiro Marinho on 19/02/24.
//

import Foundation

struct Weather: Codable {
    let weather: [WeatherInfo]
    let main: Main
}

struct WeatherInfo: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}
