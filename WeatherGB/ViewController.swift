//
//  ViewController.swift
//  WeatherGB
//
//  Created by Daniil Rassadin on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let service = Service()
   
    override func viewWillAppear(_ animated: Bool) {
        service.currentSPBWeather { weather in
            print("date: \(weather.date)")
            print("temperature: \(weather.main.temperature) °C at \(weather.name)")
        }
    }
}

