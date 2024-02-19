//
//  Service.swift
//  WeatherSwiftUi
//
//  Created by Vitor Henrique Barreiro Marinho on 19/02/24.
//

import Foundation

typealias WeatherCompletion = (Result<Weather?, Error>) -> ()

class Service {
    private let key = "e075e655fdfdda51f971d0c2b37d4bc1"
    
    func getWeather(city: String, completion: @escaping WeatherCompletion) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(key)"
        
        guard let url = URL(string: urlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { 
                completion(.success(nil))
                return }
            
            do {
                let weatherResponse = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}

