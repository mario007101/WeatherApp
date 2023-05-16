//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var mapView = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.92, longitude: 19.64),
        span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7))
    
    let locality = [
        Localite(name: "Banská Štiavnica",latitude: 48.4587,longitude: 18.8931),
        Localite(name: "Košice", latitude: 48.7203, longitude: 21.2574)
    ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapView, annotationItems: locality) { localite in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: localite.latitude, longitude: localite.longitude)){
                    NavigationLink {
                        DetailView(locality: localite)
                    } label: {
                        VStack{
                            Image(systemName: "mappin.circle.fill") //SF symbol
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                            
                            Text(localite.name)
                                .foregroundColor(.primary)
                                .font(.caption)
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
