//
//  WeatherViewModel.swift
//  WeatherSwiftUi
//
//  Created by Vitor Henrique Barreiro Marinho on 19/02/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    let service: Service
    @Published var weather: Weather?
    var cityName = ""
    
    init(service: Service) {
        self.service = service
    }
    
    func getWeather(with city: String) async {
        
        do {
            let location = try await service.getWeather(city)
            self.weather = location.main
        } catch {
            print (error)
        }
    }
    
    var temperature: String {
        guard let temp = weather?.temp else { return "" }
        let celsiusTemp = temp - 273.15
        let formatted = String(format: "%.0f", celsiusTemp)
        return "\(formatted)°C"
    }
    
    var humidity: String {
        guard let temp = weather?.humidity else { return "" }
        return String(format: "%.0f", temp)
    }
}
