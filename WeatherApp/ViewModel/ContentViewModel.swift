//
//  ContentViewModel.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

import Foundation
import MapKit

class ContentViewModel: ObservableObject {
    
    @Published var mapView = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.92, longitude: 19.64),
        span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7))
    
    let locality = [
        Localite(name: "Banská Bystrica",latitude: 48.7362,longitude: 19.1361),
        Localite(name: "Košice", latitude: 48.7203, longitude: 21.2574),
        Localite(name: "Nitra",latitude: 48.3061,longitude: 18.0763),
        Localite(name: "Bratislava", latitude: 48.1485, longitude: 17.1077),
        Localite(name: "Trnava", latitude: 48.3709, longitude: 17.5833),
        Localite(name: "Trenčín", latitude: 48.8911, longitude: 18.0422),
        Localite(name: "Prešov", latitude: 49.0018, longitude: 21.2393),
        Localite(name: "Žilina", latitude: 49.2231, longitude: 18.7394)
    ]
    
}
