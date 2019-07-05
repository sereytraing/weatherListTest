//
//  DetailWeatherVC.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import UIKit

class DetailWeatherVC: BaseVC {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var snowRiskLabel: UILabel!
    @IBOutlet weak var averageWindLabel: UILabel!
    
    let viewModel = DetailWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBinding()
    }
    
    func setupBinding() {
        self.viewModel.temperature
            .map({ value -> String in
                return "Température: \(value.convertKelvinToCelsius())°C"
            })
            .bind(to: self.temperatureLabel.rx.text)
            .disposed(by: self.viewModel.disposeBag)
        
        self.viewModel.humidity
            .map({ value -> String in
                return "Humidité: \(value)"
            })
            .bind(to: self.humidityLabel.rx.text)
            .disposed(by: self.viewModel.disposeBag)
        
        self.viewModel.averageWind
            .map({ value -> String in
                return "Vent moyen: \(value)"
            })
            .bind(to: self.averageWindLabel.rx.text)
            .disposed(by: self.viewModel.disposeBag)
        
        self.viewModel.snowRisk
            .map({ value -> String in
                return "Risque de neige: \(value)"
            })
            .bind(to: self.snowRiskLabel.rx.text)
            .disposed(by: self.viewModel.disposeBag)
        
        self.viewModel.title
            .bind(to: self.rx.title)
            .disposed(by: self.viewModel.disposeBag)
    }
}
