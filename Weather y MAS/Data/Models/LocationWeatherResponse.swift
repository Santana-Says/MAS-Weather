//
//  LocationWeatherResponse.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/23/24.
//

import Foundation

struct LocationWeatherResponse: Codable {
    let main: MainResponse
    let weather: [WeatherResponse]
    let name: String
}
