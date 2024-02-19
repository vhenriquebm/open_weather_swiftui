//
//  WeatherSwiftUiApp.swift
//  WeatherSwiftUi
//
//  Created by Vitor Henrique Barreiro Marinho on 19/02/24.
//

import SwiftUI

@main
struct WeatherSwiftUiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel(service: Service()))
        }
    }
}
