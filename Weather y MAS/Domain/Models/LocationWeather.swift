//
//  LocationWeather.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/23/24.
//

import Foundation

struct LocationWeather: Codable {
    let description: String?
    let iconData: Data?
    let iconName: String?
    let locationName: String
    let minimumTemperature: Double
    let maximumTemperature: Double
    let temperature: Double
}
