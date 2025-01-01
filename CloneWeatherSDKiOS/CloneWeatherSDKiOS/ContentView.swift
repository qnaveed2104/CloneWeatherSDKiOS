//
//  ContentView.swift
//  CloneWeatherSDKiOS
//
//  Created by Qazi on 01/01/2025.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            try? getWeatherView(apiKey: "ABS", cityName: "Munich")
        }
        .padding()
    }
}


func getWeatherView(apiKey: String, cityName: String, language: String = "en", environment: String = "") throws -> AnyView {
    let configuration = WeatherSDKConfiguration(language: language, enviroment: environment)
    
    // Initialize WeatherSDK
    let weatherSDK = try WeatherSDK(apiKey: apiKey, cityName: cityName, configuration: configuration)
    
    // Fetch Weather View
    guard let weatherView = weatherSDK.getWeatherView() else {
        throw WeatherSDK.WeatherSDKError.invalidCityName // Replace with a meaningful error
    }
    
    return weatherView
}
#Preview {
    ContentView()
}
