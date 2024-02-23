//
//  Todo.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 28/07/23.
//

import Foundation


struct ApiResponse : Codable {
    var cod : String?
    var message : Int?
    var cnt : Int?
    var list : [WeatherDetail]?
    var city : City?
    
    init() {
        print("init Without parameters")
    }
    
    init(json : Data?) throws {
        let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: json!)
        print(decodedResponse)
        self.cod = decodedResponse.cod
        self.message  = decodedResponse.message
        self.cnt = decodedResponse.cnt
        self.list = decodedResponse.list
        self.city = decodedResponse.city
    }
}


struct WeatherDetail:  Identifiable,Codable{
    var id = UUID()
    var dt: Int?
    var main :WeatherMain?
    var weather :[Weather]?
    var dateAndTime: String?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case dateAndTime = "dt_txt"
        
    }
    
    init() {
        print("init Without parameters")
    }
    
    init(json : Data?) throws {
        let decodedResponse = try JSONDecoder().decode(WeatherDetail.self, from: json!)
        print(decodedResponse)
        self.dt = decodedResponse.dt
        self.main  = decodedResponse.main
        self.weather = decodedResponse.weather
        self.dateAndTime = decodedResponse.dateAndTime
    }
    
    
}

struct Weather : Codable {
    var temp : Double?
    var main : String?
    var description : String?
}

struct WeatherMain: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int
    let groundLevel: Int
    let humidity: Int
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case humidity
    }
}

struct City : Codable {
    var name : String?
}
