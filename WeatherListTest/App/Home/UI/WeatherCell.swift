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
        self.temperatureLabel.text = "\(self.convertKelvinToCelsius(value: weather.temperature?.twoM))°C"
    }
    
    func convertKelvinToCelsius(value: Double?) -> Int {
        if let value = value {
            return Int(value - 273.15)
        }
        return 0
    }
}
