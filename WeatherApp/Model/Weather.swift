//
//  Weather.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

struct WeatherMain: Codable {
    let lat: Double
    let lon: Double
    let current: WeatherCurrent
    let daily: [WeatherDaily]
    
    struct WeatherCurrent: Codable {
        let temp: Double
        let feels_like: Double
        let weather: [WeatherDescription]
        
        struct WeatherDescription: Codable {
            let main: String
            let icon: String
        }
    }
    
    struct WeatherDaily: Codable {
        let dt: Int
        let temp: DailyTemp
        let weather: [DailyDescription]
        
        struct DailyTemp: Codable {
            let day: Double
        }
        
        struct DailyDescription: Codable {
            let icon: String
        }
    }
}
