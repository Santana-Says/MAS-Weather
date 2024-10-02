//
//  File.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/24/24.
//

import Foundation

protocol GetWeatherIconUseCase {
    func invoke(named iconName: String) async throws -> Data
}
