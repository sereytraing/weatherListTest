//
//  DetailWeatherVC.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import UIKit

class DetailWeatherVC: BaseVC {

    let viewModel = DetailWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.weather.value.date
    }
}
