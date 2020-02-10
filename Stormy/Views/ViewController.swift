//
//  ViewController.swift
//  Stormy
//
//  Created by Stephen Wall on 2/10/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let client = DarkSkyApiClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentWeather()
    }
    
    @IBAction func refreshWeatherButton(_ sender: Any) {
        getCurrentWeather()
        print("Button Tapped!")
    }
    
    
    func getCurrentWeather() {
        toggleRegreshAnimation(on: true)
        client.getCurrentWeather(at: Coordinate.alcatrazIsland) { [unowned self] currentWeather, error in
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                self.displayWeather(using: viewModel)
                self.toggleRegreshAnimation(on: false)
            }
        }
    }
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
    
    func toggleRegreshAnimation(on: Bool) {
        refreshButton.isHidden = on
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

