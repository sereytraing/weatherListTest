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
    
    override func awakeFromNib() {
    }
    
    func setupData(weather: Weather) {
        self.dateLabel.text = (weather.date ?? "") + " " + (weather.hour ?? "")
    }
}
