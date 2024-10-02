//
//  ContentViewDelegate.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/23/24.
//

import CoreLocation

protocol ContentViewDelegate {
    func handleCoordinate(_ coordinate: CLLocationCoordinate2D)
}
