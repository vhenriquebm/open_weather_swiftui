//
//  ApiEndPint.swift
//  WeatherSwiftUi
//
//  Created by Vitor Henrique Barreiro Marinho on 19/02/24.
//

import Foundation

enum ApiEndpoint {
    
    static let base_url = "https://api.openweathermap.org"
    
    case coordinatesByLocationName(String)
    case weatherByLatitudeAndLongitude(Double, Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocationName(let city):
            return "/data/2.5/weather?q=\(city)&appid=\(Constants.Keys.weatherApiKey)"
        case .weatherByLatitudeAndLongitude(let lat, let long):
            return "/data/2.5/weather?q=&appid=\(Constants.Keys.weatherApiKey)"
            
        }
    }
    
    static func endPointUrl(for endpoint: ApiEndpoint) -> URL {
        return URL(string: base_url + endpoint.path)!
    }
}
