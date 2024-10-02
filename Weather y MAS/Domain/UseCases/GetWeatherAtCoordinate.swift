//
//  GetWeatherAtCoordinate.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

protocol GetWeatherAtCoordinateUseCase {
    func invoke(latitude: Double, longitude: Double) async throws -> LocationWeather
}
