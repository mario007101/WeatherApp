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
        Localite(name: "Banská Štiavnica",latitude: 48.4587,longitude: 18.8931),
        Localite(name: "Košice", latitude: 48.7203, longitude: 21.2574)
    ]
    
}
