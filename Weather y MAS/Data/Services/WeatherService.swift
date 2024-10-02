import Foundation

class WeatherService {
    let apiKey: String = "3c0aa73d2f47ba986844d9e0f49a0c36"
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchWeather(latitude: Double, longitude: Double) async throws -> LocationWeatherResponse {
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
        
        guard var urlComponents = URLComponents(string: baseUrl) else {
            throw LocationWeatherError.invalidUrl
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "units", value: "imperial")
        ]
        
        guard let url = urlComponents.url else {
            throw LocationWeatherError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw LocationWeatherError.invalidResponse
        }
        
        let weatherResponse = try decoder.decode(LocationWeatherResponse.self, from: data)
        print(weatherResponse)
        return weatherResponse
    }
    
    func fetchWeatherIcon(named iconName: String) async throws -> Data {
        let baseUrl = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
        
        guard let url = URL(string: baseUrl) else {
            throw LocationWeatherError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw LocationWeatherError.invalidResponse
        }
        
        return data
    }
}
