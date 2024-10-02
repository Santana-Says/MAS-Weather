//
//  LocationWeatherMapper.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

extension LocationWeather {
    init(_ response: LocationWeatherResponse, iconData: Data?) {
        description = response.weather.first?.description
        self.iconData = iconData
        iconName = response.weather.first?.icon
        locationName = response.name
        maximumTemperature = response.main.tempMax
        minimumTemperature = response.main.tempMin
        temperature = response.main.temp
    }
}
