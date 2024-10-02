//
//  Weather_y_MASApp.swift
//  Weather y MAS
//
//  Created by Jeffrey Santana on 10/1/24.
//

import GooglePlaces
import SwiftUI

@main
struct Weather_y_MASApp: App {
    init() {
        GMSPlacesClient.provideAPIKey("AIzaSyC1kp5uE4o9eTO3Gm4uciXlcKXhN1ZfrlM")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
