//
//  ContentView.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/23/24.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var isPresentingSearch: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            createWeatherView()
            
            Spacer()
            
            Button(action: {
                isPresentingSearch.toggle()
            }, label: {
                Text("Select a Location")
            })
            .buttonStyle(.bordered)
        }
        .onAppear {
            DispatchQueue.main.async {
                viewModel.locationManager.requestLocationPermission()
            }
        }
        .popover(isPresented: $isPresentingSearch, content: {
            SearchViewControllerRepresentable(contentViewDelegate: viewModel)
        })
    }
    
    @ViewBuilder
    private func createWeatherView() -> some View {
        if let weather = viewModel.weather {
            VStack {
                Text(weather.locationName)
                    .font(.title)
                
                if let imageData = weather.iconData,
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
                
                Text(viewModel.convertToTemperatureString(temperature: weather.temperature))
                    .font(.title)
                
                HStack {
                    Text(viewModel.convertToTemperatureString(temperature: weather.minimumTemperature))
                    Text(viewModel.convertToTemperatureString(temperature: weather.maximumTemperature))
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ContentView()
}
