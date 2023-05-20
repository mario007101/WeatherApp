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
                                //Need to finish to search for specific lan and lon
                                let latitudeOfSearchedTown: Double = 0.0
                                let longitudeOfSearchTown: Double = 0.0
                                
                                let newLocation = Localite(name: name, latitude: latitudeOfSearchedTown, longitude: longitudeOfSearchTown)
                                
                                DetailView(locality: newLocation)
                            } label: {
                                Text(name)
                            }
                            Divider()
                        }
                    }
                }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black)
                    .cornerRadius(8)
                
                var searchResult: [String] {
                    let lowercasedText = finderText.prefix(1).lowercased()
                    
                    if finderText.isEmpty {
                        return villagesAndTownsReturn.allTownsAndVillages
                    } else if lowercasedText == finderText.prefix(1) {
                        return villagesAndTownsReturn.allTownsAndVillages.filter{ $0.lowercased().contains(finderText)}
                    } else {
                        return villagesAndTownsReturn.allTownsAndVillages.filter { $0.contains(finderText)}
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
