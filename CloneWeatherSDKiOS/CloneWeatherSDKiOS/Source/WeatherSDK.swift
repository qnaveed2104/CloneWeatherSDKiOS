//
//  WeatherSDK.swift
//  CloneWeatherSDKiOS
//
//  Created by Qazi on 01/01/2025.
//


import Foundation
import SwiftUI

// MARK: - WeatherSDKDelegate Protocol
public protocol WeatherSDKDelegate: AnyObject {
    func onFinished()
    func onFinishedWithError(_ error: Error)
}

// MARK: - WeatherSDK Class (Interface)
public final class WeatherSDK {
    public weak var delegate: WeatherSDKDelegate?
    
    // MARK: - Properties
    private let apiKey: String
    private let cityName: String
    public var configuration: WeatherSDKConfiguration?
    
    public init(apiKey: String, cityName: String, configuration: WeatherSDKConfiguration) throws {
        guard !apiKey.isEmpty else { throw WeatherSDKError.invalidAPIKey }
        guard !cityName.isEmpty else { throw WeatherSDKError.invalidCityName }
        
        self.apiKey = apiKey
        self.cityName = cityName
        self.configuration = configuration
    }
    
    // MARK: - Methods (Declarations)
    /// Returns a weather view configured with the appropriate view model.
    /// - Returns: A `WeatherView` instance.
    public func getWeatherView() -> AnyView? {
        return createWeatherViewModel()
    }
    
    // MARK: - Internal Helper Methods (Acts like decode logic)
    internal func createWeatherViewModel() -> AnyView {
        let viewModel = WeatherViewModel(apiKey: apiKey, cityName: cityName)
        return AnyView(WeatherView(viewModel: viewModel))

    }
    
    public enum WeatherSDKError: Error, LocalizedError {
        case invalidAPIKey
        case invalidCityName
        
        public var errorDescription: String? {
            switch self {
            case .invalidAPIKey:
                return "The API key provided is invalid."
            case .invalidCityName:
                return "The city name provided is invalid."
            }
        }
    }
}

