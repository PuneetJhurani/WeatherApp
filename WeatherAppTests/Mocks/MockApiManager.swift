//
//  MocApiManager.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 14/09/23.
//

import Foundation

class MockApiManager: NetworkProtocol {
    
    func getAnyEntity(pincode: String ,completion: @escaping (ApiResponse?, ResponseException?) -> Void) {
        let dummyString = """
       {
         "cod": "200",
         "message": 0,
         "cnt": 40,
         "list": [
           {
             "dt": 1708614000,
             "main": {
               "temp": 294.03,
               "feels_like": 292.8,
               "temp_min": 292.22,
               "temp_max": 294.03,
               "pressure": 1013,
               "sea_level": 1013,
               "grnd_level": 988,
               "humidity": 24,
               "temp_kf": 1.81
             },
             "weather": [
               {
                 "id": 800,
                 "main": "Clear",
                 "description": "clear sky",
                 "icon": "01n"
               }
             ],
             "clouds": {
               "all": 3
             },
             "wind": {
               "speed": 2.54,
               "deg": 315,
               "gust": 5.19
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
               "pod": "n"
             },
             "dt_txt": "2024-02-22 15:00:00" }],
         "city": {
         "id": 0,
        "name": "Shalimar Bagh (North West Delhi)",
        "coord": {
        "lat": 28.7219,
        "lon": 77.159
        },
        "country": "IN",
       "population": 0,
       "timezone": 19800,
       "sunrise": 1708565072,
       "sunset": 1708605944
        }
      }
      """

        do {
            var apiResponse = try  ApiResponse.init(json: dummyString.data(using: String.Encoding.utf8))
            completion(apiResponse, nil)
        }catch{
            print("Inside Exception")
        }
        
    }
}
