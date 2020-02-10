//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Stephen Wall on 2/10/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import Foundation
import UIKit

// Prepares the CurrentWeather model to be applied to Views. 
struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init(model: CurrentWeather) {
        // Temp
        let roundedTemp = Int(model.temperature)
        self.temperature = "\(roundedTemp)°"
        // Humidity
        let humidityPercent = Int(model.humidity * 100)
        self.humidity = "\(humidityPercent)%"
        // PrecipProbability
        let precipPercent = Int(model.precipProbability * 100)
        self.precipitationProbability = "\(precipPercent)%"
        // Summary
        self.summary = model.summary
        // Icon
        let iconImage: UIImage
        switch model.icon {
        case "clear-day": iconImage = #imageLiteral(resourceName: "clear-day")
        case "clear-night": iconImage = #imageLiteral(resourceName: "clear-night.png")
        case "rain": iconImage = #imageLiteral(resourceName: "rain")
        case "snow": iconImage = #imageLiteral(resourceName: "snow.png")
        case "sleet": iconImage = #imageLiteral(resourceName: "sleet.png")
        case "wind": iconImage = #imageLiteral(resourceName: "wind.png")
        case "fog": iconImage =  #imageLiteral(resourceName: "fog.png")
        case "cloudy": iconImage = #imageLiteral(resourceName: "cloudy.png")
        case "partly-cloudy-day": iconImage =  #imageLiteral(resourceName: "partly-cloudy.png")
        case "partly-cloudy-night": iconImage = #imageLiteral(resourceName: "cloudy-night.png")
        default:
            iconImage = #imageLiteral(resourceName: "default.png")
        }
        self.icon = iconImage
    }
}
