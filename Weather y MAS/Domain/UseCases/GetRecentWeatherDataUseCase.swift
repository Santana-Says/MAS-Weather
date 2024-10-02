//
//  GetRecentWeatherDataUseCase.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

protocol GetRecentWeatherDataUseCase {
    func invoke() -> LocationWeather?
}
