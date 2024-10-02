//
//  AppUserDefaults.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

class AppUserDefaults {
    private enum UserDefaultKeys: String {
        case weatherData
    }
    
    func SetRecentWeatherDataUseCase(_ data: LocationWeather) {
        if let encodedUser = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedUser, forKey: UserDefaultKeys.weatherData.rawValue)
        }
    }
    
    func getRecentWeatherData() -> LocationWeather? {
        guard let data = UserDefaults.standard.data(forKey: UserDefaultKeys.weatherData.rawValue) else { return nil }
        return try? JSONDecoder().decode(LocationWeather.self, from: data)
    }
}
