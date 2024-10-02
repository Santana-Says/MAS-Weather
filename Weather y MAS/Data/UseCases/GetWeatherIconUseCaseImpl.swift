//
//  File.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

struct GetWeatherIconUseCaseImpl: GetWeatherIconUseCase {
    private let weatherService = WeatherService()
    
    func invoke(named iconName: String) async throws -> Data {
        try await weatherService.fetchWeatherIcon(named: iconName)
    }
}
