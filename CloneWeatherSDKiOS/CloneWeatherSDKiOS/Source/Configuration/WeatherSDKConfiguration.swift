//
//  WeatherSDKConfiguration.swift
//  CloneWeather
//
//  Created by Qazi on 24/12/2024.
//

import Foundation

// MARK: - WeatherSDK Configuration
public struct WeatherSDKConfiguration {
    let language: String
    let enviroment: String
    
    // Removed default values from the initializer
    public init(language: String,enviroment: String ) {
        self.language = language
        self.enviroment = enviroment
    }
    
}
