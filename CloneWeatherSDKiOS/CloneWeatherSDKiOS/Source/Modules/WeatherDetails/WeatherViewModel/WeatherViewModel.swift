//
//  WeatherViewModel.swift
//  CloneWeather
//
//  Created by Qazi on 25/12/2024.
//

import Foundation

// MARK: - Internal Weather View Model
/// This class is hidden from public access.
class WeatherViewModel: ObservableObject {
    let apiKey: String
    let cityName: String
    
    init(apiKey: String, cityName: String) {
        self.apiKey = apiKey
        self.cityName = cityName
    }
}
