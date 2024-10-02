//
//  GetWeatherAtCoordinateUseCaseImpl.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

struct GetWeatherAtCoordinateUseCaseImpl: GetWeatherAtCoordinateUseCase {
    private let weatherService = WeatherService()
    
    func invoke(latitude: Double, longitude: Double) async throws -> LocationWeather {
        let response = try await weatherService.fetchWeather(latitude: latitude, longitude: longitude)
        let iconData: Data? = if let icon = response.weather.first?.icon {
            try? await weatherService.fetchWeatherIcon(named: icon)
        } else { nil }
        let weather = LocationWeather(response, iconData: iconData)
        
        return weather
    }
}
