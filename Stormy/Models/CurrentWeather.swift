//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Stephen Wall on 2/10/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    let temperature: Double
    let humidity: Double
    let precipProbability: Double
    let summary: String
    let icon: String
    
    // We can create custom keys for Codable like this:
    // Otherwise it will create the keys as the same strings as the constant names above.
//    enum CurrentWeatherCodingKeys: String, CodingKey {
//        case temperature = "temperature"
//        case humidity = "humidity"
//        case precipProbability = "precipProbability"
//        case summary = "summary"
//        case icon = "icon"
//    }
}
