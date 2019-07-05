//
//  WeatherCell.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
    }
    
    func setupData(weather: Weather) {
        self.dateLabel.text = (weather.date ?? "") + " " + (weather.hour ?? "")
        if let temperature = weather.temperature?.twoM {
            self.temperatureLabel.text = "\(temperature.convertKelvinToCelsius())°C"
        }
    }
    
    func setupData(weather: WeatherRealm) {
        self.dateLabel.text = weather.date + " " + weather.hour
        if let temperature = weather.temperature?.twoM {
             self.temperatureLabel.text = "\(temperature.convertKelvinToCelsius())°C"
        }
    }
}
