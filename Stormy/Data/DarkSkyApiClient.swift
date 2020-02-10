//
//  DarkSkyApiClient.swift
//  Stormy
//
//  Created by Stephen Wall on 2/10/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import Foundation

class DarkSkyApiClient {
    fileprivate let darkSkyApiKey = "fdd87998038033d62b527326252ad4b8"
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(darkSkyApiKey)/")!
    }()
    let decoder = JSONDecoder()
    let session: URLSession
       
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
   
    convenience init() {
       self.init(configuration: .default)
    }
    
    typealias WeatherCompletionHandler = (Weather?, Error?) -> Void
    private func getWeather(at coordinate: Coordinate, completionHandler completion: @escaping WeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, DarkSkyError.invalidUrl)
            return
        }
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                // HAS DATA
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, DarkSkyError.requestFailed)
                        return
                    }
                    // SUCCESS RESPONSE
                    if httpResponse.statusCode == 200 {
                        do {
                            let weather = try self.decoder.decode(Weather.self, from: data)
                            completion(weather, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    //FAILED RESPONSE
                    } else {
                        completion(nil, DarkSkyError.invalidData)
                    }
                // NO DATA
                } else if let error = error {
                    completion(nil, error)
                }
            }
            
        }
        
        task.resume()
    }
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getWeather(at: coordinate) { weather, error in
            completion(weather?.currently, error)
        }
    }
    
    
}
