//
//  DetailView.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

import SwiftUI

struct DetailView: View {
    @State private var weatherResult: WeatherMain?
    
    let locality: Localite
    
    let icon = [
        "01d": "sun.max.fill",
        "02d": "cloud.sun.fill",
        "03d": "cloud.fill",
        "04d": "smoke.fill",
        "09d": "cloud.sun.rain.fill",
        "10d": "cloud.heavyrain.fill",
        "11d": "cloud.bolt.fill",
        "13d": "cloud.snow.fill",
        "50d": "text.aligncenter"
    ]
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("\(Date.now, format: .dateTime.day().month().year())")
                    .font(.callout)
                    .padding(.bottom, 20)
                
                Text(weatherResult?.current.weather.first?.main ?? "...")
                    .font(.system(size: 35))
                    .padding(.bottom, -30)
                
                Text("\(Int(weatherResult?.current.temp ?? 0))°C")
                    .font(.system(size: 65))
                    .fontWeight(.black)
                
                Text("Feeling temperature \(Int(weatherResult?.current.feels_like ?? 0)) °C")
                    .padding(.bottom, 50)
                    .padding(.top, -40)
                    .foregroundColor(.gray)
                
                if let day = weatherResult?.daily {
                    ForEach(day, id: \.dt) { day in
                        HStack{
                            Text(dayInWeek(day.dt))
                                .frame(width: 110,alignment: .leading)
                            Spacer()
                            Image(systemName: icon[day.weather.first!.icon] ?? "exclamationmark.square")
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
                downloadData(lat: locality.latitude, lon: locality.longitude)
            }
    }
    
    func downloadData(lat:  Double, lon: Double){
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly,alerts&appid=\(APIKey.appID)&units=metric"
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) {data, response, erorr in
            
            if let erorr = erorr {
                print("Erorr: \(erorr.localizedDescription)")
                return
            }
            
            guard let data = data else { //Unwrap
                print("Mising data!")
                return
            }
            
            if let json = try? JSONDecoder().decode(WeatherMain.self, from: data){
                weatherResult = json
            }
        }
        task.resume()
    }
    
    func dayInWeek(_ num: Int) -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE")
        let jsonDate = Date(timeIntervalSince1970: TimeInterval(num))
        let dateString = formatter.string(from: jsonDate).capitalized
        
        return dateString
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bs = Localite(name: "Banská Štiavnica",latitude: 48.4587,longitude: 18.8931)
        DetailView(locality: bs)
    }
}
