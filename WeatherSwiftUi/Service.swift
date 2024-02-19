//
//  Service.swift
//  WeatherSwiftUi
//
//  Created by Vitor Henrique Barreiro Marinho on 19/02/24.
//

import Foundation

typealias WeatherCompletion = (Result<WeatherResponse?, Error>) -> ()

class Service {
    
    func getWeather(_ city: String) async throws -> WeatherResponse {
        
        let (data, _) = try await URLSession.shared.data(from: ApiEndPoint.endPointUrl(for: .coordinatesByLocationName(city)))
        
        let location = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return location
    }
}

