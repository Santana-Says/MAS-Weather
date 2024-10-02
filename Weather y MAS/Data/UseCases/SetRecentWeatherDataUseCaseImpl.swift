//
//  SetRecentWeatherDataUseCaseImpl.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

struct SetRecentWeatherDataUseCaseImpl: SetRecentWeatherDataUseCase {
    func invoke(_ data: LocationWeather) {
        AppUserDefaults().SetRecentWeatherDataUseCase(data)
    }
}
