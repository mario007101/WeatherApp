//
//  DetailViewModel.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

import Foundation

class DetailViewModel: ObservableObject{
    @Published var weatherResult: WeatherMain?
    
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
                DispatchQueue.main.async {
                    self.weatherResult = json
                }
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
