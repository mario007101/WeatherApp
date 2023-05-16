//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var contentModel = ContentViewModel()
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $contentModel.mapView, annotationItems: contentModel.locality) { localite in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: localite.latitude, longitude: localite.longitude)){
                    NavigationLink {
                        DetailView(locality: localite)
                    } label: {
                        VStack{
                            Image(systemName: "mappin.circle.fill") //SF symbol
                                .resizable()
                                .frame(width: 35, height: 35)
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
