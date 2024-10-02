//
//  GetRecentWeatherDataImpl.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

struct GetRecentWeatherDataUseCaseImpl: GetRecentWeatherDataUseCase {
    func invoke() -> LocationWeather? {
        AppUserDefaults().getRecentWeatherData()
    }
}
