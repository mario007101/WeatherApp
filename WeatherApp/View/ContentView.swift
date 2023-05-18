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
    @State private var finderText = ""
    @StateObject private var villagesAndTownsReturn = DetailViewModel()
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $contentModel.mapView, annotationItems: contentModel.locality) { localite in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: localite.latitude, longitude: localite.longitude)){
                    NavigationLink {
                        DetailView(locality: localite)
                    } label: {
                        VStack{
                            Image(systemName: "mappin.and.ellipse") //SF symbol
                                .resizable()
                                .frame(width: 25, height: 35)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .searchable(text: $finderText, prompt: "Enter a location") {
                ScrollView{
                    VStack(alignment: .leading){
                        ForEach(searchResult, id: \.self) { name in
                            NavigationLink {
                                Text(name)
                            } label: {
                                Text(name)
                            }
                        }
                        
                    }
                }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black)
                    .cornerRadius(8)
                
                var searchResult: [String] {
                    if finderText.isEmpty {
                        return villagesAndTownsReturn.allTownsAndVillages
                    }
                    //Need to finish to search also with lowercased characters
                    else {
                        return villagesAndTownsReturn.allTownsAndVillages.filter{ $0.contains(finderText)}
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
