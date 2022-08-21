//
//  Service.swift
//  WeatherGB
//
//  Created by Daniil Rassadin on 20.08.2022.
//

import UIKit
import Alamofire

class Service {
    
    let session = Session.shared
    
    let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    func currentSPBWeather (completion: @escaping (Weather) -> ()) {
        let URL = baseURL + "weather"
        let parameters: Parameters = [
            "lat": "59.95",
            "lon": "30.31",
            "appid": session.APIKey
        ]
        
        AF.request(URL, method: .get, parameters: parameters).responseDecodable(of: Weather.self) { response in
            if let data = response.data {
                let weather = try? JSONDecoder().decode(Weather.self, from: data)
                if let weather = weather {
                    completion(weather)
                } else {
                    print("no data")
                }
            }
        }
    }
}
