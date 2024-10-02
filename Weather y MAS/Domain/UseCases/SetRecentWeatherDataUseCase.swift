//
//  SetRecentWeatherDataUseCase.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

protocol SetRecentWeatherDataUseCase {
    func invoke(_ data: LocationWeather)
}
