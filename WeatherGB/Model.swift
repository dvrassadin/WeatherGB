//
//  Model.swift
//  WeatherGB
//
//  Created by Daniil Rassadin on 20.08.2022.
//

import UIKit

struct Weather: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.date = Date(timeIntervalSince1970: try container.decode(Double.self, forKey: .date))
        self.main = try container.decode(Main.self, forKey: .main)        
        
    }
    
    var date: Date
    var main: Main
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name, main
        case date = "dt"
    }
}

struct Main: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temperature = try container.decode(Float16.self, forKey: .temperature) - 273
    }
    
    var temperature: Float16

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}
