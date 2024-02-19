//
//  Weather.swift
//  WeatherSwiftUi
//
//  Created by Vitor Henrique Barreiro Marinho on 19/02/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Int?
}


