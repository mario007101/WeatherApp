//
//  DetailView.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var detailModel = DetailViewModel()
    
    let locality: Localite
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("\(Date.now, format: .dateTime.day().month().year())")
                    .font(.callout)
                    .padding(.bottom, 20)
                
                Text(detailModel.weatherResult?.current.weather.first?.main ?? "...")
                    .font(.system(size: 35))
                    .padding(.bottom, -30)
                
                Text("\(Int(detailModel.weatherResult?.current.temp ?? 0))°C")
                    .font(.system(size: 65))
                    .fontWeight(.black)
                
                Text("Feeling temperature \(Int(detailModel.weatherResult?.current.feels_like ?? 0)) °C")
                    .padding(.bottom, 50)
                    .padding(.top, -40)
                    .foregroundColor(.gray)
                
                if let day = detailModel.weatherResult?.daily {
                    ForEach(day, id: \.dt) { day in
                        HStack{
                            Text(detailModel.dayInWeek(day.dt))
                                .frame(width: 110,alignment: .leading)
                            Spacer()
                            Image(systemName: detailModel.icon[day.weather.first!.icon] ?? "exclamationmark.square")
                                .symbolRenderingMode(.multicolor)
                            Spacer()
                            Text("\(Int(day.temp.day))°C")
                                .frame(width: 60,alignment: .trailing)
                        }
                        .padding(.bottom, 3)
                        Divider()
                    }
                }
                
            }
        }
        .padding(20)
        .navigationTitle(locality.name)
            .onAppear(){
                detailModel.downloadData(lat: locality.latitude, lon: locality.longitude)
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bs = Localite(name: "Banská Štiavnica",latitude: 48.4587,longitude: 18.8931)
        DetailView(locality: bs)
    }
}
