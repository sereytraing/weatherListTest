//
//  DetailWeatherViewModel.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RxSwift
import RxCocoa

class DetailWeatherViewModel: BaseViewModel {
    
    var weather                = BehaviorRelay<Weather>(value: Weather())
    var weatherRealm           = BehaviorRelay<WeatherRealm>(value: WeatherRealm())
    var temperature            = BehaviorRelay<Double>(value: 0.0)
    var humidity               = BehaviorRelay<Double>(value: 0.0)
    var snowRisk               = BehaviorRelay<String>(value: "")
    var averageWind            = BehaviorRelay<Double>(value: 0.0)
    var title                  = BehaviorRelay<String>(value: "")
    let disposeBag             = DisposeBag()
    
    func setupData(weatherRealm: WeatherRealm) {
        if let temperature = weatherRealm.temperature {
            self.temperature.accept(temperature.twoM)
        }
        if let humidity = weatherRealm.humidity {
            self.humidity.accept(humidity.twoM)
        }
        if let averageWind = weatherRealm.averageWind {
            self.averageWind.accept(averageWind.tenM)
        }
        self.snowRisk.accept(weatherRealm.snowRisk)
        self.title.accept(weatherRealm.dateHour)
    }
}
