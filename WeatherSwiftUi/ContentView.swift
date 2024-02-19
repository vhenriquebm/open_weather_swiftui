//
//  ContentView.swift
//  WeatherSwiftUi
//
//  Created by Vitor Henrique Barreiro Marinho on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack() {
            
            TextField("Enter City Name", text: $viewModel.cityName) {
                Task {
                    await self.viewModel.getWeather(with: viewModel.cityName)
                }
            }
            .font(.custom("Arial", size: 50))
            .padding()
            .fixedSize()
            
            VStack(alignment: .center) {
                Text(viewModel.temperature)
                    .font(.custom("Arial", size: 50))
                    .fixedSize()
                
            }
            .padding()
            
            
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    ContentView(viewModel: WeatherViewModel(service: Service()))
}
