//
//  ContentViewModel.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation
import CoreLocation

class ContentViewModel: ObservableObject {
    @Published private(set) var weather: LocationWeather?
    
    private let isPreviewRunning = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    private let getRecentWeatherDataUseCase = GetRecentWeatherDataUseCaseImpl() //mock Dependency Ingection
    private let getWeatherAtCoordinateUseCase = GetWeatherAtCoordinateUseCaseImpl() //mock Dependency Ingection
    private let setRecentWeatherDataUseCase = SetRecentWeatherDataUseCaseImpl() //mock Dependency Ingection
    let locationManager = LocationManager()
    
    init() {
        if isPreviewRunning {
            weather = LocationWeather(description: "cloudy", 
                                      iconData: nil,
                                      iconName: nil,
                                      locationName: "Miami",
                                      minimumTemperature: 80,
                                      maximumTemperature: 95.4,
                                      temperature: 91.7)
        } else {
            weather = getRecentWeatherDataUseCase.invoke()
        }
    }
    
    func getWeather(at coordinate: CLLocationCoordinate2D) {
        Task {
            do {
                let weather = try await getWeatherAtCoordinateUseCase.invoke(latitude: coordinate.latitude, longitude: coordinate.longitude)
                
                setRecentWeatherDataUseCase.invoke(weather)
                
                DispatchQueue.main.async {
                    self.weather = weather
                }
            } catch {
                print("Failed to fetch weather: \(error)")
            }
        }
    }
    
    func convertToTemperatureString(temperature: Double) -> String {
        String(format: "%.1f", temperature)
    }
}

extension ContentViewModel: ContentViewDelegate {
    func handleCoordinate(_ coordinate: CLLocationCoordinate2D) {
        print("Coordinate: \(coordinate)")
        
        getWeather(at: coordinate)
    }
}
