//
//  WeatherView.swift
//  CloneWeather
//
//  Created by Qazi on 25/12/2024.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        Text("Weather for \(viewModel.cityName)")
    }
}
