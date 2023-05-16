//
//  Locality.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

import Foundation

struct Localite: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}
